var currency_available = ['rupee','dollar','ruble','euro','pound','yen','franc','dinar'];

double Convert_Currency(String drop_down_value_1,double ip_currency,String drop_down_value_2)
{
  if(drop_down_value_1 == drop_down_value_2)
    return ip_currency;

  double rupee = other_to_rupee(drop_down_value_1,ip_currency);

  return rupee_to_other(drop_down_value_2,rupee);
}

double other_to_rupee(drop_down_value_1,other)
{
  double rupee = other;

  if(drop_down_value_1 == 'dollar')
    rupee = other*82.65;
  else if(drop_down_value_1 == 'ruble')
    rupee = other*1.12;
  else if(drop_down_value_1 == 'euro')
    rupee = other*88.24;
  else if(drop_down_value_1 == 'pound')
    rupee = other*99.88;
  else if(drop_down_value_1 == 'yen')
    rupee = other*0.63;
  else if(drop_down_value_1 == 'franc')
    rupee = other*89.63;
  else if(drop_down_value_1 == 'dinar')
    rupee = other*270.13;

  return rupee;
}

double rupee_to_other(drop_down_value_2,rupee)
{
  double other = rupee;

  if(drop_down_value_2 == 'dollar')
    other = rupee/82.65;
  else if(drop_down_value_2 == 'ruble')
    other = rupee/1.12;
  else if(drop_down_value_2 == 'euro')
    other = rupee/88.24;
  else if(drop_down_value_2 == 'pound')
    other = rupee/99.88;
  else if(drop_down_value_2 == 'yen')
    other = rupee/0.63;
  else if(drop_down_value_2 == 'franc')
    other = rupee/89.63;
  else if(drop_down_value_2 == 'dinar')
    other = rupee/270.13;

  return other;
}