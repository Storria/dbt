{% test wage_value(model, column_name=None) %}
    select *
    from {{ model }}
    where wage_eur > value_eur
{% endtest %}