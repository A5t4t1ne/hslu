﻿// Decompiled with JetBrains decompiler
// Type: SolarWinds.Orion.Core.BusinessLayer.MaintUpdateNotifySvc.MaintUpdateNotifySvcClient
// Assembly: SolarWinds.Orion.Core.BusinessLayer, Version=2019.4.5200.9083, Culture=neutral, PublicKeyToken=null
// MVID: E12E8C85-5CD9-4E06-8801-182E5104FADE
// Assembly location: E:\task5.dll

using System.CodeDom.Compiler;
using System.Diagnostics;
using System.ServiceModel;
using System.ServiceModel.Channels;
using System.Threading.Tasks;

#nullable disable
namespace SolarWinds.Orion.Core.BusinessLayer.MaintUpdateNotifySvc
{
  [DebuggerStepThrough]
  [GeneratedCode("System.ServiceModel", "4.0.0.0")]
  public class MaintUpdateNotifySvcClient : ClientBase<IMaintUpdateNotifySvc>, IMaintUpdateNotifySvc
  {
    public MaintUpdateNotifySvcClient()
    {
    }

    public MaintUpdateNotifySvcClient(string endpointConfigurationName)
      : base(endpointConfigurationName)
    {
    }

    public MaintUpdateNotifySvcClient(string endpointConfigurationName, string remoteAddress)
      : base(endpointConfigurationName, remoteAddress)
    {
    }

    public MaintUpdateNotifySvcClient(
      string endpointConfigurationName,
      EndpointAddress remoteAddress)
      : base(endpointConfigurationName, remoteAddress)
    {
    }

    public MaintUpdateNotifySvcClient(Binding binding, EndpointAddress remoteAddress)
      : base(binding, remoteAddress)
    {
    }

    public UpdateResponse GetData(UpdateRequest request) => this.Channel.GetData(request);

    public Task<UpdateResponse> GetDataAsync(UpdateRequest request)
    {
      return this.Channel.GetDataAsync(request);
    }

    public UpdateResponse GetLocalizedData(UpdateRequest request, string locale)
    {
      return this.Channel.GetLocalizedData(request, locale);
    }

    public Task<UpdateResponse> GetLocalizedDataAsync(UpdateRequest request, string locale)
    {
      return this.Channel.GetLocalizedDataAsync(request, locale);
    }
  }
}
