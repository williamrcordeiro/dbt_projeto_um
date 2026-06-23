{% snapshot pedido_snapshot %}
    {{
        config(
            target='clientes',
            target_schema='projeto_um_stg',
            unique_key='id',
            strategy='timestamp',
            updated_at='data_registro'
        )
    }}

    select
        id
        , nome
        , email
        , telefone
        , CAST(data_registro AS TIMESTAMP) AS data_registro
    from {{ ref('stg_clientes') }}

{% endsnapshot %}