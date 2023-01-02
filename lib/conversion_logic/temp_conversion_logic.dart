var temp_available = ['Celcius','Fahrenheit','Kelvin','Rankine'];

double Convert_Temperature(String drop_down_value_1,double ip_temp,String drop_down_value_2)
{
  if(drop_down_value_1 == drop_down_value_2)
    return ip_temp;

  double celcius = other_to_celcius(drop_down_value_1,ip_temp);

  return celcius_to_other(drop_down_value_2,celcius);
}

double other_to_celcius(drop_down_value_1,other)
{
  double celcius = other;

  if(drop_down_value_1 == 'Fahrenheit')
    celcius = (other-32)*5/9;
  else if(drop_down_value_1 == 'Kelvin')
    celcius = other - 273.15;
  else if(drop_down_value_1 == 'Rankine')
    celcius = (other - 491.67)*5/9;

  return celcius;
}

double celcius_to_other(drop_down_value_2,celcius)
{
  double other = celcius;

  if(drop_down_value_2 == 'Fahrenheit')
    other = (9*celcius/5) + 32;
  else if(drop_down_value_2 == 'Kelvin')
    other = celcius + 273.15;
  else if(drop_down_value_2 == 'Rankine')
    other = 491.67 + celcius*9/5;

  return other;
}