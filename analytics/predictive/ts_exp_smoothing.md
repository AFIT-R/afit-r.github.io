---
layout: tutorial
title: Exponential Smoothing
permalink: /ts_exp_smoothing
---

<img src="/public/images/analytics/time_series/es10-1.png"  style="float:right; margin: 2px 0px 0px 10px; width: 40%; height: 40%;" />
Smoothing methods are a family of forecasting methods that average values over multiple periods in order to reduce the noise and uncover patterns in the data.  Moving averages are one such smoothing method.  Moving averages is a smoothing approach that averages values from a window of consecutive time periods, thereby generating a series of averages. The moving average approaches primarily differ based on the number of values averaged, how the average is computed, and how many times averaging is performed.  This tutorial will walk you through the basics of performing moving averages.
