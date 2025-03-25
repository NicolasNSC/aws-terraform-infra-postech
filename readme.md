# AWS Terraform Pós-Tech

Este repositório contém um projeto desenvolvido para provisionamento de recursos na AWS, incluindo RDS e EKS, utilizando Terraform. O objetivo é aplicar na prática os conhecimentos adquiridos na pós-graduação em Arquitetura de Software da FIAP, implementando infraestrutura como código (IaC) na nuvem AWS.

## **Objetivos**
- Implementar práticas de **CI/CD**, permitindo deploy automatizado na conta AWS.
- Provisionar um **cluster Kubernetes (EKS)** para orquestração de containers.
- Provisionar um **banco de dados (RDS)** para armazenamento persistente.

## **Pré-requisitos**
Para utilizar este repositório, é necessário:
- Ter uma conta na AWS com permissões adequadas.
- Instalar o **Terraform** localmente para testes opcionais.
- Configurar as credenciais fornecidas pela **AWS Academy**.
- Acesso ao **GitHub Actions** para execução da pipeline automatizada.

## **Como executar**
1. Crie a configuração do seu recurso como um **módulo** na raiz do projeto.
2. Adicione o caminho do módulo na **seleção de opções do workflow manual** no GitHub.
3. Execute a pipeline para provisionar o recurso desejado utilizando Terraform.

A pipeline automatizada garante que o provisionamento seja realizado de forma segura e padronizada, seguindo as melhores práticas de DevOps.

---

### **Execução opcional (local)**
Se desejar testar localmente antes de utilizar a pipeline:
```
Instale o Terraform e configure as credenciais AWS localmente.
Execute os comandos Terraform conforme a documentação oficial.
```

Caso precise de mais informações, consulte a documentação oficial do Terraform e da AWS para configurar sua infraestrutura corretamente.

