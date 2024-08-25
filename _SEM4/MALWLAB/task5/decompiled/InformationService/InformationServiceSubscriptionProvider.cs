﻿// Decompiled with JetBrains decompiler
// Type: SolarWinds.Orion.Core.BusinessLayer.InformationService.InformationServiceSubscriptionProvider
// Assembly: SolarWinds.Orion.Core.BusinessLayer, Version=2019.4.5200.9083, Culture=neutral, PublicKeyToken=null
// MVID: E12E8C85-5CD9-4E06-8801-182E5104FADE
// Assembly location: E:\task5.dll

using SolarWinds.InformationService.Contract2;
using SolarWinds.InformationService.Contract2.PubSub;
using SolarWinds.Logging;
using SolarWinds.Orion.Core.Common;
using SolarWinds.Orion.Core.Common.Interfaces;
using System;
using System.Collections.Generic;
using System.ServiceModel;
using System.ServiceModel.Channels;

#nullable disable
namespace SolarWinds.Orion.Core.BusinessLayer.InformationService
{
  internal class InformationServiceSubscriptionProvider : IInformationServiceSubscriptionProvider
  {
    private readonly Log log = new Log();
    private readonly InfoServiceProxy swisProxy;
    private readonly string netObjectOperationEndpoint;
    private readonly List<string> subscriptionUriList = new List<string>();
    private const string SubscriptionEntity = "System.Subscription";

    private InformationServiceSubscriptionProvider(
      Func<string, InfoServiceProxy> proxyFactory,
      string netObjectOperationEndpoint)
    {
      if (!RegistrySettings.IsFullOrion())
        throw new InvalidOperationException("Subscription of Indications on non primary poller.");
      this.netObjectOperationEndpoint = !string.IsNullOrEmpty(netObjectOperationEndpoint) ? netObjectOperationEndpoint : throw new ArgumentException(nameof (netObjectOperationEndpoint));
      this.swisProxy = proxyFactory("localhost");
    }

    internal InformationServiceSubscriptionProvider()
      : this(new Func<string, InfoServiceProxy>(InformationServiceConnectionProvider.CreateProxyForCertificate), "net.tcp://localhost:17777/Orion/Core/BusinessLayer/OperationSubscriber")
    {
    }

    internal static InformationServiceSubscriptionProvider CreateV3()
    {
      return new InformationServiceSubscriptionProvider(new Func<string, InfoServiceProxy>(InformationServiceConnectionProvider.CreateProxyForCertificateV3), "net.tcp://localhost:17777/Orion/Core/BusinessLayer/OperationSubscriber");
    }

    public InformationServiceSubscriptionProvider(string netObjectOperationEndpoint)
      : this(new Func<string, InfoServiceProxy>(InformationServiceConnectionProvider.CreateProxyForCertificate), netObjectOperationEndpoint)
    {
    }

    public static InformationServiceSubscriptionProvider CreateV3(string netObjectOperationEndpoint)
    {
      return new InformationServiceSubscriptionProvider(new Func<string, InfoServiceProxy>(InformationServiceConnectionProvider.CreateProxyForCertificateV3), netObjectOperationEndpoint);
    }

    public string Subscribe(string subscribeQuery, INotificationSubscriber notificationSubscriber)
    {
      if (string.IsNullOrEmpty(subscribeQuery))
        throw new ArgumentException(nameof (subscribeQuery));
      ServiceHost serviceHost = notificationSubscriber != null ? new ServiceHost((object) notificationSubscriber, Array.Empty<Uri>()) : throw new ArgumentNullException(nameof (notificationSubscriber));
      System.Type implementedContract = typeof (INotificationSubscriber);
      NetTcpBinding netTcpBinding = new NetTcpBinding();
      netTcpBinding.PortSharingEnabled = true;
      string operationEndpoint = this.netObjectOperationEndpoint;
      serviceHost.AddServiceEndpoint(implementedContract, (Binding) netTcpBinding, operationEndpoint);
      serviceHost.Open();
      PropertyBag propertyBag = new PropertyBag();
      ((Dictionary<string, object>) propertyBag).Add("Query", (object) subscribeQuery);
      ((Dictionary<string, object>) propertyBag).Add("EndpointAddress", (object) this.netObjectOperationEndpoint);
      string str = this.swisProxy.Create("System.Subscription", propertyBag);
      this.subscriptionUriList.Add(str);
      this.log.DebugFormat("Swis subscribed with subscriptionUri: {0}", (object) str);
      this.log.DebugFormat("Swis subscribed with query: {0}", (object) subscribeQuery);
      return str;
    }

    public void Unsubscribe(string subscriptionUri) => this.swisProxy.Delete(subscriptionUri);

    public void UnsubscribeAll() => this.swisProxy.BulkDelete(this.subscriptionUriList.ToArray());
  }
}
