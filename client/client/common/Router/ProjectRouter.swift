//
//  ProjectRouter.swift
//  client
//
//  Created by Anurag Agnihotri on 6/24/16.
//  Copyright © 2016 LocusIdeas. All rights reserved.
//

import Foundation
import Alamofire

enum ProjectRouter: BaseRouterProtocol {
    
    case GetProjects()
    case GetProjectById(String)
    case UpdateProject(String, Project)
    case GetProjectMediaByProjectId(String)
    case GetProjectsByURL(String)
    case GetProjectsByOwner(String)
    
    var baseURL: String {
        switch self {
            
        case .GetProjectsByURL(let url):
            return "http:" + url
            
        default:
            return BaseRouter.baseURL
        }
    }
    
    var path: String {
        
        switch self {
        
        case .GetProjects:
            return "/api/projects"
            
        case .GetProjectById(let projectId):
            return "/api/projects/\(projectId)"
            
        case .UpdateProject(let projectId, _):
            return "/api/projects/\(projectId)"
            
        case .GetProjectMediaByProjectId(let projectId):
            return "/api/projects/\(projectId)/medias"
        
        case .GetProjectsByURL:
            return ""
            
        case .GetProjectsByOwner(let ownerId):
            return "/api/projects/owner/\(ownerId)"
        }
    }
    
    var method: Alamofire.Method {
        
        switch self {
        
        case .GetProjectById:
            return .GET
        
        case .GetProjects:
            return .GET
        
        case .UpdateProject:
            return .PUT
            
        case .GetProjectMediaByProjectId:
            return .GET
            
        case .GetProjectsByURL:
            return .GET
            
        case .GetProjectsByOwner:
            return .GET
        }
    }
    
    var parameters: AnyObject? {
        
        switch self {
        
        default:
            return nil
        
        }
    }
 
    var body: BaseRequestBody? {
        
        switch self {
        
        case .UpdateProject(_, let request):
            return request
            
        default:
            return BaseRequestBody()
        
        }
    }
}