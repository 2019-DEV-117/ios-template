//
//  APIEndpoint.swift
//  {{ cookiecutter.project_name }}
//
//  Created by {{ cookiecutter.lead_dev }} on 11/1/16.
//  Copyright © 2016 {{ cookiecutter.company_name }}. All rights reserved.
//

import Alamofire
import Marshal

protocol APIEndpoint {

    var path: String { get }
    var method: HTTPMethod { get }
    var encoding: ParameterEncoding { get }
    var requiresAuth: Bool { get }
    var parameters: JSONObject? { get }
    var headers: HTTPHeaders { get }

}
