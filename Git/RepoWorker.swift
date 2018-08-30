//
//  RepoWorker.swift
//  Git
//
//  Created by Alumno on 30/08/18.
//  Copyright © 2018 Angelica. All rights reserved.
//\
import Foundation

class RepoWorker {
    
    enum UrlGit: String {
        case base = "https://api.github.com"
        case allRepo = "/repositories"
        case filterUser = "/users/"
        case detail = "/repos/"
        case filterOrganitacion = "/orgs/"
        case end = "/repos"
    }
    
    
    var allRepos: [Repo] = []
    
    //MARK:- Inicializador
    private init() {}
   
    static func shared()-> RepoWorker {
        return RepoWorker()
    }
    
    // MARK:- funciones
    
    func url(type: UrlGit, name: String = "") -> String {
        switch type {
        case .allRepo:
            return UrlGit.base.rawValue+UrlGit.allRepo.rawValue
        case .filterUser:
             return UrlGit.base.rawValue+UrlGit.filterUser.rawValue+name
        case .detail:
             return UrlGit.base.rawValue+UrlGit.detail.rawValue+name+UrlGit.end.rawValue
        case .filterOrganitacion:
            return UrlGit.base.rawValue+UrlGit.filterOrganitacion.rawValue+name
 
        default:
            return ""
        }
    }
    func fetchRepos(completion: [Repo]-> Void) {
        completion(self.allRepos)
    }
    
    func filter(name: String,completion: [Repo]-> Void) -> [Repo] {
        return self.allRepos.filter({$0.name==name || $0.owner == name})
    }
    
    func filterServer(name: String,completion: [Repo] -> Void) {
        completion( self.allRepos.filter({$0.name==name || $0.owner == name}))
    }
    
    func getDetailRepo(repo: Repo) -> Repo {
        return repo
    }
}
