//Trabalho de Bryan Strey, Matheus Braschi Haliski, Victor Luís e Stephanny Almeida Lopes de Araújo

import Foundation

// Enum de Prioridade
enum Prioridade {
    case baixa, media, alta
    
    var descricao: String {
        switch self {
        case .baixa: return "[Baixa Prioridade]"
        case .media: return "[Média Prioridade]"
        case .alta: return "[Alta Prioridade] URGENTE!"
        }
    }
}

// Protocolo Notificavel
protocol Notificavel {
    var mensagem: String { get }
    var prioridade: Prioridade { get }
    func enviarNotificacao()
}

extension Notificavel {
    // Implementação padrão para enviar notificação
    func enviarNotificacao() {
        print("\(mensagem) \(prioridade.descricao)")
    }
}

// Struct para Email
struct Email: Notificavel {
    let mensagem: String
    let prioridade: Prioridade
    let enderecoEmail: String
    
    func enviarNotificacao() {
        print("Enviando email para \(enderecoEmail): \(mensagem) \(prioridade.descricao)")
    }
}

// Struct para SMS
struct SMS: Notificavel {
    let mensagem: String
    let prioridade: Prioridade
    let numeroTelefone: String
    
    func enviarNotificacao() {
        print("Enviando SMS para \(numeroTelefone): \(mensagem) \(prioridade.descricao)")
    }
}

// Struct para Push Notification
struct PushNotification: Notificavel {
    let mensagem: String
    let prioridade: Prioridade
    let tokenDispositivo: String
    
    func enviarNotificacao() {
        print("Enviando Push Notification para \(tokenDispositivo): \(mensagem) \(prioridade.descricao)")
    }
}

// Instâncias de canais de notificação com nova mensagem de evento e DDD 41
let notificacoes: [Notificavel] = [
    Email(mensagem: "Promoção especial para você!", prioridade: .alta, enderecoEmail: "cliente@example.com"),
    SMS(mensagem: "Lembre-se de que o evento começa às 18h.", prioridade: .media, numeroTelefone: "+5541 90000-0000"),
    PushNotification(mensagem: "Alerta de segurança na sua conta.", prioridade: .baixa, tokenDispositivo: "abcd1234")
]

// Enviar notificações
notificacoes.forEach { $0.enviarNotificacao() }
