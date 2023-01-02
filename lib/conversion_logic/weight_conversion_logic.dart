var weight_available = ['gram','kg','ton','pound','ounces','quintal'];

double Convert_Weight(String drop_down_value_1,double ip_weight,String drop_down_value_2)
{
  if(drop_down_value_1 == drop_down_value_2)
    return ip_weight;

  double kilogram = other_to_kilogram(drop_down_value_1,ip_weight);

  return kilogram_to_other(drop_down_value_2,kilogram);
}

double other_to_kilogram(drop_down_value_1,other)
{
  double kilogram = other;

  if(drop_down_value_1 == 'gram')
    kilogram = other/1000;
  else if(drop_down_value_1 == 'ton')
    kilogram = other*1000;
  else if(drop_down_value_1 == 'pound')
    kilogram = other*0.4536;
  else if(drop_down_value_1 == 'ounces')
    kilogram = other*0.02835;
  else if(drop_down_value_1 == 'quintal')
    kilogram = other*100;

  return kilogram;
}

double kilogram_to_other(drop_down_value_2,kilogram)
{
  double other = kilogram;

  if(drop_down_value_2 == 'gram')
    other = kilogram*1000;
  else if(drop_down_value_2 == 'ton')
    other = kilogram/1000;
  else if(drop_down_value_2 == 'pound')
    other = kilogram/0.4536;
  else if(drop_down_value_2 == 'ounces')
    other = kilogram/0.02835;
  else if(drop_down_value_2 == 'quintal')
    other = kilogram/100;

  return other;
}