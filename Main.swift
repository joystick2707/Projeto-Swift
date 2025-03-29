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

// Enum TipoMensagem
enum TipoMensagem {
    case promocao, lembrete, alerta
}

// Struct Mensagem
struct Mensagem {
    let tipo: TipoMensagem
    let conteudo: String
}

// Protocolo Notificavel
protocol Notificavel {
    var mensagem: Mensagem { get }
    var prioridade: Prioridade { get }
    func enviarNotificacao()
}

extension Notificavel {
    // Implementação padrão para enviar notificação
    func enviarNotificacao() {
        print("Enviando notificação... \(mensagem.conteudo) \(prioridade.descricao)")
    }
}

// Struct para Email
struct Email: Notificavel {
    let mensagem: Mensagem
    let prioridade: Prioridade
    let enderecoEmail: String
    
    func enviarNotificacao() {
        print("Enviando email para \(enderecoEmail): \(mensagem.conteudo) \(prioridade.descricao)")
    }
}

// Struct para SMS
struct SMS: Notificavel {
    let mensagem: Mensagem
    let prioridade: Prioridade
    let numeroTelefone: String
    
    func enviarNotificacao() {
        print("Enviando SMS para \(numeroTelefone): \(mensagem.conteudo) \(prioridade.descricao)")
    }
}

// Struct para Push Notification
struct PushNotification: Notificavel {
    let mensagem: Mensagem
    let prioridade: Prioridade
    let tokenDispositivo: String
    
    func enviarNotificacao() {
        print("Enviando Push Notification para \(tokenDispositivo): \(mensagem.conteudo) \(prioridade.descricao)")
    }
}

// Instâncias de mensagens com tipos específicos
let promocaoMensagem = Mensagem(tipo: .promocao, conteudo: "Promoção especial para você!")
let lembreteMensagem = Mensagem(tipo: .lembrete, conteudo: "Lembre-se de que o evento começa às 18h.")
let alertaMensagem = Mensagem(tipo: .alerta, conteudo: "Alerta de segurança na sua conta.")

// Instâncias de canais de notificação com mensagens associadas
let notificacoes: [Notificavel] = [
    Email(mensagem: promocaoMensagem, prioridade: .alta, enderecoEmail: "cliente@example.com"),
    SMS(mensagem: lembreteMensagem, prioridade: .media, numeroTelefone: "+5541 90000-0000"),
    PushNotification(mensagem: alertaMensagem, prioridade: .baixa, tokenDispositivo: "abcd1234")
]

// Enviar notificações
notificacoes.forEach { $0.enviarNotificacao() }
