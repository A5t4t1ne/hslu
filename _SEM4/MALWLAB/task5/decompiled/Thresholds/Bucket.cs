﻿// Decompiled with JetBrains decompiler
// Type: SolarWinds.Orion.Core.BusinessLayer.Thresholds.Bucket
// Assembly: SolarWinds.Orion.Core.BusinessLayer, Version=2019.4.5200.9083, Culture=neutral, PublicKeyToken=null
// MVID: E12E8C85-5CD9-4E06-8801-182E5104FADE
// Assembly location: E:\task5.dll

#nullable disable
namespace SolarWinds.Orion.Core.BusinessLayer.Thresholds
{
  internal class Bucket
  {
    public Bucket(double minValue, double maxValue)
    {
      this.MinValue = minValue;
      this.MaxValue = maxValue;
    }

    public double MinValue { get; set; }

    public double MaxValue { get; set; }
  }
}
