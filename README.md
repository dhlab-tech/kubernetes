# Роли для развертывания кластера Kubernetes

 * **cert** - генерирует все необходимые для кластеров Kubernetes и Etcd сертификаты и копирует их на хосты в нужные места. Сами сертификаты и запросы остаются в {{ certdir }} и должны быть сохранены для дальнейшего использования (например, добавления новых нод). Если на момент запуска роли в этой папке уже есть нужные сертификаты, то заново не генерируются, а используются существующие. Применять роль нужно к локалхосту - список мастеров/нод будет получен автоматически из inventory (ищет хосты, относящиеся к группам kubemasters,kubenodes,etcd).
 * **crio** - устанавливает и настраивает cri-o - альтернативный рантайм для docker контейнеров. Применять имеет смысл только к нодам, т.к на мастерах ничего в контейнерах не запускается.
 * **etcd** - разворачивает кластер Etcd. Должна выполняться после роли **cert**, т.к кластеру для запуска нужны ключи
 * **kube-control-plane** - разворачивает мастер-сервисы kubernetes - apiserver,controller-manager и scheduler. Также устанавливает self-hosted сервис DNS.
 * **kube-router** - устанавливает self-hosted daemonset kube-router, необходимый для работы сети
 * **kubeconfig** - генерирует kubeconfig файлы для **kubelet**
 * **kubectl** - устанавливает kubectl - cli для kubernetes
 * **kubelet** - устанавливает и настраивает kubelet, имеет смысл применять только к нодам
 * **system** - системные настройки, должна применяться в самом начале

