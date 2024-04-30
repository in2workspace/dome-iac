<h1>Entorno Local para test E2E de Desmos</h1>

# Introducción

El compose.yaml de esta carpeta permite levantar un entorno local para test E2E de Desmos.
Esto es, 2 instancias de un Access Node (Context Broker, Desmos, DLT-Adapter), un nodo blockchain de prueba (compartido 
para los dos Access Nodes) y un Nginx que facilita la comunicación entre los Access Nodes y el nodo blockchain.

![Local Environment](./assets/local-env.png)

# Requisitos
- Docker Desktop

# ¿Cómo usarlo?
