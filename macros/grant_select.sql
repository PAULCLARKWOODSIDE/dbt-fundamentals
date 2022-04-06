{% macro grant_select(schema=target.schema, role=target.role) %}
    
    {% set query %}
       GRANT USAGE ON SCHEMA {{schema}} TO ROLE {{ role }};
       GRANT SELECT ON ALL TABLES IN SCHEMA {{schema}} TO ROLE {{ role }};
       GRANT SELECT ON ALL VIEWS IN SCHEMA {{schema}} TO ROLE {{ role }};
    {% endset %}

    {{ log('Granting SELECT on all TABLES and VIEWS in SCHEMA' ~ schema ~ ' TO ROLE ' ~ role ~ '...' ~ query, info=True)}} 
    {% do run_query(query) %}
    {{ log('Privileges granted!', info=True)}}  

{% endmacro %}}