{% macro template_example() %}
    
    {% set query %}
        select True as bool
    {% endset %}

    {% if execute %}
        {% set results = run_query(query).columns[0].values()[0] %}         --First row, fist col SELECT query
        {{ log('SQL results ' ~ results, info=True) }}
        
        
        SELECT {{results}} AS is_real
        FROM a_real_table

    {% endif %}

{% endmacro %}