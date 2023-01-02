var length_available = ['cm','meter','km','inch','foot','yard','mile'];

double Convert_Length(String drop_down_value_1,double ip_length,String drop_down_value_2)
{
  if(drop_down_value_1 == drop_down_value_2)
    return ip_length;

  double meter = other_to_meter(drop_down_value_1,ip_length);

  return meter_to_other(drop_down_value_2,meter);
}

double other_to_meter(drop_down_value_1,other)
{
  double meter = other;

  if(drop_down_value_1 == 'cm')
    meter = other/100;
  else if(drop_down_value_1 == 'km')
    meter = other*1000;
  else if(drop_down_value_1 == 'inch')
    meter = other*0.0254;
  else if(drop_down_value_1 == 'foot')
    meter = other*0.3048;
  else if(drop_down_value_1 == 'yard')
    meter = other*0.9144;
  else if(drop_down_value_1 == 'mile')
    meter = other*1609.34;

  return meter;
}

double meter_to_other(drop_down_value_2,meter)
{
  double other = meter;

  if(drop_down_value_2 == 'cm')
    other = meter*100;
  else if(drop_down_value_2 == 'km')
    other = meter/1000;
  else if(drop_down_value_2 == 'inch')
    other = meter/0.0254;
  else if(drop_down_value_2 == 'foot')
    other = meter/0.3048;
  else if(drop_down_value_2 == 'yard')
    other = meter/0.9144;
  else if(drop_down_value_2 == 'mile')
    other = meter/1609.34;

  return other;
}