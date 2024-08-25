﻿// Decompiled with JetBrains decompiler
// Type: SolarWinds.Orion.Core.BusinessLayer.CentralizedSettings.ServiceManager
// Assembly: SolarWinds.Orion.Core.BusinessLayer, Version=2019.4.5200.9083, Culture=neutral, PublicKeyToken=null
// MVID: E12E8C85-5CD9-4E06-8801-182E5104FADE
// Assembly location: E:\task5.dll

using SolarWinds.Logging;
using SolarWinds.Orion.Core.BusinessLayer.ConfigurationSettings;
using SolarWinds.Orion.Core.Common.CentralizedSettings;
using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceProcess;
using System.Threading.Tasks;

#nullable disable
namespace SolarWinds.Orion.Core.BusinessLayer.CentralizedSettings
{
  public class ServiceManager
  {
    private static readonly Log Log = new Log();
    protected static List<IWindowsServiceController> services;
    private static ServiceManager instance;

    public static ServiceManager Instance
    {
      get => ServiceManager.instance ?? (ServiceManager.instance = new ServiceManager());
    }

    protected ServiceManager() => ServiceManager.services = ServiceManager.GetAllWindowsServices();

    protected ServiceManager(List<IWindowsServiceController> servicesLst)
    {
      ServiceManager.services = servicesLst;
    }

    private static List<IWindowsServiceController> GetAllWindowsServices()
    {
      return new List<IWindowsServiceController>((IEnumerable<IWindowsServiceController>) ((IEnumerable<ServiceController>) ServiceController.GetServices()).Select<ServiceController, WindowsServiceController>((Func<ServiceController, WindowsServiceController>) (s => new WindowsServiceController(s.ServiceName))).ToList<WindowsServiceController>());
    }

    public Dictionary<string, string> GetServicesDisplayNames(List<string> servicesNames)
    {
      return ServiceManager.services.Where<IWindowsServiceController>((Func<IWindowsServiceController, bool>) (s => servicesNames.Any<string>((Func<string, bool>) (x => x.Equals(s.ServiceName, StringComparison.OrdinalIgnoreCase))) && s.Status != ServiceControllerStatus.StopPending && s.Status != ServiceControllerStatus.Stopped)).Distinct<IWindowsServiceController>().ToDictionary<IWindowsServiceController, string, string>((Func<IWindowsServiceController, string>) (s => s.ServiceName), (Func<IWindowsServiceController, string>) (s => s.DisplayName));
    }

    public Dictionary<string, WindowsServiceRestartState> GetServicesStates(
      List<string> servicesNames)
    {
      return ServiceManager.services.Where<IWindowsServiceController>((Func<IWindowsServiceController, bool>) (s => servicesNames.Any<string>((Func<string, bool>) (x => x.Equals(s.ServiceName, StringComparison.OrdinalIgnoreCase))))).Distinct<IWindowsServiceController>().ToDictionary<IWindowsServiceController, string, WindowsServiceRestartState>((Func<IWindowsServiceController, string>) (s => s.ServiceName), (Func<IWindowsServiceController, WindowsServiceRestartState>) (s => s.RestartState));
    }

    public void RestartServices(List<string> servicesNames)
    {
      Parallel.ForEach<IWindowsServiceController>(ServiceManager.services.Where<IWindowsServiceController>((Func<IWindowsServiceController, bool>) (s => servicesNames.Any<string>((Func<string, bool>) (x => x.Equals(s.ServiceName, StringComparison.OrdinalIgnoreCase))))), (Action<IWindowsServiceController>) (currentElement =>
      {
        try
        {
          ServiceManager.Log.DebugFormat("Restarting service {0} started", (object) currentElement.DisplayName);
          currentElement.RestartState = (WindowsServiceRestartState) 0;
          int serviceTimeout = WindowsServiceSettings.Instance.ServiceTimeout;
          int tickCount = Environment.TickCount;
          TimeSpan timeSpan1 = TimeSpan.FromMilliseconds((double) serviceTimeout);
          if (currentElement.Status == ServiceControllerStatus.Running)
          {
            currentElement.Stop();
            currentElement.WaitForStatus(ServiceControllerStatus.Stopped, timeSpan1);
          }
          TimeSpan timeSpan2 = TimeSpan.FromMilliseconds((double) (serviceTimeout - (Environment.TickCount - tickCount)));
          if (currentElement.Status == ServiceControllerStatus.Stopped)
          {
            currentElement.Start();
            currentElement.WaitForStatus(ServiceControllerStatus.Running, timeSpan2);
          }
          currentElement.RestartState = (WindowsServiceRestartState) 1;
          ServiceManager.Log.DebugFormat("Restarting service {0} ended", (object) currentElement.DisplayName);
        }
        catch (Exception ex)
        {
          currentElement.RestartState = (WindowsServiceRestartState) 2;
          ServiceManager.Log.DebugFormat("Restarting service {0} failed. {1}", (object) currentElement.DisplayName, (object) ex);
        }
      }));
    }
  }
}
