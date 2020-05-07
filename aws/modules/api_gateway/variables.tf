#-----------------------------------------------------------
# Global or/and default variables
#-----------------------------------------------------------
variable "name" {
  description = "Name to be used on all resources as prefix"
  default     = "TEST"
}

variable "environment" {
    description = "Environment for service"
    default     = "STAGE"
}

variable "tags" {
    description = "A list of tag blocks. Each element should have keys named key, value, etc."
    type        = map(string)
    default     = {}
}

#---------------------------------------------------
# AWS API Gateway account
#---------------------------------------------------
variable "enable_api_gateway_account" {
  description   = "Enable api gateway account usage"
  default       = false
}

variable "api_gateway_account_cloudwatch_role_arn" {
  description   = "(Optional) The ARN of an IAM role for CloudWatch (to allow logging & monitoring). See more in AWS Docs. Logging & monitoring can be enabled/disabled and otherwise tuned on the API Gateway Stage level."
  default       = null
}

#---------------------------------------------------
# AWS API Gateway api key
#---------------------------------------------------
variable "enable_api_gateway_api_key" {
  description   = "Enable api gateway api key usage"
  default       = false
}

variable "api_gateway_api_key_name" {
  description   = "The name of the API key"
  default       = ""
}

variable "api_gateway_api_key_description" {
  description   = "(Optional) The API key description. Defaults to 'Managed by Terraform'."
  default       = "Managed by Terraform"
}

variable "api_gateway_api_key_enabled" {
  description   = "(Optional) Specifies whether the API key can be used by callers. Defaults to true."
  default       = true
}

variable "api_gateway_api_key_value" {
  description   = "(Optional) The value of the API key. If not specified, it will be automatically generated by AWS on creation."
  default       = null
}

#---------------------------------------------------
# AWS API Gateway rest api
#---------------------------------------------------
variable "enable_api_gateway_rest_api" {
  description   = "Enable api gateway rest api usage"
  default       = false
}

variable "api_gateway_rest_api_name" {
  description   = "The name of the REST API"
  default       = ""
}

variable "api_gateway_rest_api_description" {
  description   = "(Optional) The description of the REST API"
  default       = null
}

variable "api_gateway_rest_api_binary_media_types" {
  description   = "(Optional) The list of binary media types supported by the RestApi. By default, the RestApi supports only UTF-8-encoded text payloads."
  default       = null
}

variable "api_gateway_rest_api_minimum_compression_size" {
  description   = "(Optional) Minimum response size to compress for the REST API. Integer between -1 and 10485760 (10MB). Setting a value greater than -1 will enable compression, -1 disables compression (default)."
  default       = -1
}

variable "api_gateway_rest_api_body" {
  description   = "(Optional) An OpenAPI specification that defines the set of routes and integrations to create as part of the REST API."
  default       = null
}

variable "api_gateway_rest_api_policy" {
  description   = "(Optional) JSON formatted policy document that controls access to the API Gateway. For more information about building AWS IAM policy documents with Terraform, see the AWS IAM Policy Document Guide"
  default       = null
}

variable "api_gateway_rest_api_api_key_source" {
  description   = "(Optional) The source of the API key for requests. Valid values are HEADER (default) and AUTHORIZER."
  default       = "HEADER"
}

variable "api_gateway_rest_api_endpoint_configuration" {
  description   = "(Optional) Nested argument defining API endpoint configuration including endpoint type."
  default       = []
}

#---------------------------------------------------
# AWS API Gateway authorizer
#---------------------------------------------------
variable "enable_api_gateway_authorizer" {
  description   = "Enable api gateway authorizer usage"
  default       = false
}

variable "api_gateway_authorizer_name" {
  description   = "The name of the authorizer"
  default       = ""
}

variable "api_gateway_authorizer_rest_api_id" {
  description   = "The ID of the associated REST API"
  default       = ""
}

variable "api_gateway_authorizer_authorizer_uri" {
  description   = "(Optional, required for type TOKEN/REQUEST) The authorizer's Uniform Resource Identifier (URI). This must be a well-formed Lambda function URI in the form of arn:aws:apigateway:{region}:lambda:path/{service_api}, e.g. arn:aws:apigateway:us-west-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-west-2:012345678912:function:my-function/invocations"
  default       = null
}

variable "api_gateway_authorizer_authorizer_credentials" {
  description   = "(Optional) The credentials required for the authorizer. To specify an IAM Role for API Gateway to assume, use the IAM Role ARN."
  default       = null
}

variable "api_gateway_authorizer_authorizer_result_ttl_in_seconds" {
  description   = "(Optional) The TTL of cached authorizer results in seconds. Defaults to 300."
  default       = 300
}

variable "api_gateway_authorizer_identity_source" {
  description   = "(Optional) The source of the identity in an incoming request. Defaults to method.request.header.Authorization. For REQUEST type, this may be a comma-separated list of values, including headers, query string parameters and stage variables - e.g."
  default       = null
}

variable "api_gateway_authorizer_type" {
  description   = "(Optional) The type of the authorizer. Possible values are TOKEN for a Lambda function using a single authorization token submitted in a custom header, REQUEST for a Lambda function using incoming request parameters, or COGNITO_USER_POOLS for using an Amazon Cognito user pool. Defaults to TOKEN."
  default       = "TOKEN"
}

variable "api_gateway_authorizer_identity_validation_expression" {
  description   = "(Optional) A validation expression for the incoming identity. For TOKEN type, this value should be a regular expression. The incoming token from the client is matched against this expression, and will proceed if the token matches. If the token doesn't match, the client receives a 401 Unauthorized response."
  default       = null
}

variable "api_gateway_authorizer_provider_arns" {
  description   = "(Optional, required for type COGNITO_USER_POOLS) A list of the Amazon Cognito user pool ARNs. Each element is of this format: arn:aws:cognito-idp:{region}:{account_id}:userpool/{user_pool_id}."
  default       = null
}

#---------------------------------------------------
# AWS API Gateway VPC link
#---------------------------------------------------
variable "enable_api_gateway_vpc_link" {
  description   = "Enable api gateway vpc link usage"
  default       = false
}

variable "api_gateway_vpc_link_name" {
  description   = "The name used to label and identify the VPC link."
  default       = ""
}

variable "api_gateway_vpc_link_target_arns" {
  description   = "(Required, ForceNew) The list of network load balancer arns in the VPC targeted by the VPC link. Currently AWS only supports 1 target."
  default       = null
}

variable "api_gateway_vpc_link_description" {
  description   = "(Optional) The description of the VPC link."
  default       = null
}

#---------------------------------------------------
# AWS API Gateway resource
#---------------------------------------------------
variable "enable_api_gateway_resource" {
  description   = "Enable api gateway resource usage"
  default       = false
}

variable "api_gateway_resource_rest_api_id" {
  description   = "The ID of the associated REST API"
  default       = ""
}

variable "api_gateway_resource_parent_id" {
  description   = "The ID of the parent API resource"
  default       = ""
}

variable "api_gateway_resource_path_part" {
  description   = "(Required) The last path segment of this API resource."
  default       = null
}

#---------------------------------------------------
# AWS API Gateway request validator
#---------------------------------------------------
variable "enable_api_gateway_request_validator" {
  description   = "Enable api gateway request validator usage"
  default       = false
}

variable "api_gateway_request_validator_name" {
  description   = "The name of the request validator"
  default       = ""
}

variable "api_gateway_request_validator_rest_api_id" {
  description   = "The ID of the associated Rest API"
  default       = ""
}

variable "api_gateway_request_validator_validate_request_body" {
  description   = "(Optional) Boolean whether to validate request body. Defaults to false."
  default       = false
}

variable "api_gateway_request_validator_validate_request_parameters" {
  description   = "(Optional) Boolean whether to validate request parameters. Defaults to false."
  default       = false
}

#---------------------------------------------------
# AWS API Gateway model
#---------------------------------------------------
variable "enable_api_gateway_model" {
  description   = "Enable api gateway model usage"
  default       = false
}

variable "api_gateway_model_name" {
  description   = "The name of the model"
  default       = ""
}

variable "api_gateway_model_rest_api_id" {
  description   = "The ID of the associated REST API"
  default       = ""
}

variable "api_gateway_model_content_type" {
  description   = "(Required) The content type of the model"
  default       = null
}

variable "api_gateway_model_schema" {
  description   = "(Required) The schema of the model in a JSON form"
  default       = null
}

variable "api_gateway_model_description" {
  description   = "(Optional) The description of the model"
  default       = null
}

#---------------------------------------------------
# AWS API Gateway method
#---------------------------------------------------
variable "enable_api_gateway_method" {
  description   = "Enable api gateway method usage"
  default       = false
}

variable "api_gateway_method_rest_api_id" {
  description   = "The ID of the associated REST API"
  default       = ""
}

variable "api_gateway_method_resource_id" {
  description   = "The API resource ID"
  default       = ""
}

variable "api_gateway_method_http_method" {
  description   = "(Required) The HTTP Method (GET, POST, PUT, DELETE, HEAD, OPTIONS, ANY)"
  default       = "GET"
}

variable "api_gateway_method_authorization" {
  description   = "(Required) The type of authorization used for the method (NONE, CUSTOM, AWS_IAM, COGNITO_USER_POOLS)"
  default       = "NONE"
}

variable "api_gateway_method_authorizer_id" {
  description   = "(Optional) The authorizer id to be used when the authorization is CUSTOM or COGNITO_USER_POOLS"
  default       = null
}

variable "api_gateway_method_authorization_scopes" {
  description   = "(Optional) The authorization scopes used when the authorization is COGNITO_USER_POOLS"
  default       = null
}

variable "api_gateway_method_api_key_required" {
  description   = "(Optional) Specify if the method requires an API key"
  default       = null
}

variable "api_gateway_method_request_models" {
  description   = "Optional) A map of the API models used for the request's content type where key is the content type (e.g. application/json) and value is either Error, Empty (built-in models) or aws_api_gateway_model's name."
  default       = null
}

variable "api_gateway_method_request_validator_id" {
  description   = "(Optional) The ID of a aws_api_gateway_request_validator"
  default       = null
}

variable "api_gateway_method_request_parameters" {
  description   = "(Optional) A map of request parameters (from the path, query string and headers) that should be passed to the integration. The boolean value indicates whether the parameter is required (true) or optional (false). For example: request_parameters = {'method.request.header.X-Some-Header' = true 'method.request.querystring.some-query-param' = true} would define that the header X-Some-Header and the query string some-query-param must be provided in the request."
  default       = null
}

#---------------------------------------------------
# AWS API Gateway method response
#---------------------------------------------------
variable "enable_api_gateway_method_response" {
  description   = "Enable api gateway method response usage"
  default       = false
}

variable "api_gateway_method_response_rest_api_id" {
  description   = "The ID of the associated REST API"
  default       = ""
}

variable "api_gateway_method_response_resource_id" {
  description   = "The API resource ID"
  default       = ""
}

variable "api_gateway_method_response_http_method" {
  description   = "The HTTP Method (GET, POST, PUT, DELETE, HEAD, OPTIONS, ANY)"
  default       = ""
}

variable "api_gateway_method_response_status_code" {
  description   = "(Required) The HTTP status code"
  default       = 200
}

variable "api_gateway_method_response_response_models" {
  description   = "(Optional) A map of the API models used for the response's content type"
  default       = null
}

variable "api_gateway_method_response_response_parameters" {
  description   = "(Optional) A map of response parameters that can be sent to the caller. For example: response_parameters = { 'method.response.header.X-Some-Header' = true } would define that the header X-Some-Header can be provided on the response."
  default       = null
}

#---------------------------------------------------
# AWS API Gateway integration
#---------------------------------------------------
variable "enable_api_gateway_integration" {
  description = "Enable api gateway integration usage"
  default     = false
}

variable "api_gateway_integration_rest_api_id" {
  description = "The ID of the associated REST API."
  default     = ""
}

variable "api_gateway_integration_resource_id" {
  description = "The API resource ID."
  default     = ""
}

variable "api_gateway_integration_http_method" {
  description = "The HTTP method (GET, POST, PUT, DELETE, HEAD, OPTION, ANY) when calling the associated resource."
  default     = ""
}

variable "api_gateway_integration_type" {
  description = "(Required) The integration input's type. Valid values are HTTP (for HTTP backends), MOCK (not calling any real backend), AWS (for AWS services), AWS_PROXY (for Lambda proxy integration) and HTTP_PROXY (for HTTP proxy integration). An HTTP or HTTP_PROXY integration with a connection_type of VPC_LINK is referred to as a private integration and uses a VpcLink to connect API Gateway to a network load balancer of a VPC."
  default     = null
}

variable "api_gateway_integration_integration_http_method" {
  description = "(Optional) The integration HTTP method (GET, POST, PUT, DELETE, HEAD, OPTIONs, ANY, PATCH) specifying how API Gateway will interact with the back end. Required if type is AWS, AWS_PROXY, HTTP or HTTP_PROXY. Not all methods are compatible with all AWS integrations. e.g. Lambda function can only be invoked via POST."
  default     = null
}

variable "api_gateway_integration_connection_type" {
  description = "(Optional) The integration input's connectionType. Valid values are INTERNET (default for connections through the public routable internet), and VPC_LINK (for private connections between API Gateway and a network load balancer in a VPC)."
  default     = null
}

variable "api_gateway_integration_connection_id" {
  description = "(Optional) The id of the VpcLink used for the integration. Required if connection_type is VPC_LINK"
  default     = null
}

variable "api_gateway_integration_uri" {
  description = "(Optional) The input's URI. Required if type is AWS, AWS_PROXY, HTTP or HTTP_PROXY. For HTTP integrations, the URI must be a fully formed, encoded HTTP(S) URL according to the RFC-3986 specification . For AWS integrations, the URI should be of the form arn:aws:apigateway:{region}:{subdomain.service|service}:{path|action}/{service_api}. region, subdomain and service are used to determine the right endpoint. e.g. arn:aws:apigateway:eu-west-1:lambda:path/2015-03-31/functions/arn:aws:lambda:eu-west-1:012345678901:function:my-func/invocations"
  default     = null
}

variable "api_gateway_integration_credentials" {
  description = "(Optional) The credentials required for the integration. For AWS integrations, 2 options are available. To specify an IAM Role for Amazon API Gateway to assume, use the role's ARN. To require that the caller's identity be passed through from the request."
  default     = null
}

variable "api_gateway_integration_request_templates" {
  description = "(Optional) A map of the integration's request templates."
  default     = null
}

variable "api_gateway_integration_request_parameters" {
  description = "(Optional) A map of request query string parameters and headers that should be passed to the backend responder. For example: request_parameters = { 'integration.request.header.X-Some-Other-Header' = 'method.request.header.X-Some-Header' }"
  default     = null
}

variable "api_gateway_integration_passthrough_behavior" {
  description = "(Optional) The integration passthrough behavior (WHEN_NO_MATCH, WHEN_NO_TEMPLATES, NEVER). Required if request_templates is used."
  default     = null
}

variable "api_gateway_integration_cache_key_parameters" {
  description = "(Optional) A list of cache key parameters for the integration."
  default     = null
}

variable "api_gateway_integration_cache_namespace" {
  description = "(Optional) The integration's cache namespace."
  default     = null
}

variable "api_gateway_integration_content_handling" {
  description = "(Optional) Specifies how to handle request payload content type conversions. Supported values are CONVERT_TO_BINARY and CONVERT_TO_TEXT. If this property is not defined, the request payload will be passed through from the method request to integration request without modification, provided that the passthroughBehaviors is configured to support payload pass-through."
  default     = null
}

variable "api_gateway_integration_timeout_milliseconds" {
  description = "(Optional) Custom timeout between 50 and 29,000 milliseconds. The default value is 29,000 milliseconds."
  default     = null
}

#---------------------------------------------------
# AWS API Gateway integration response
#---------------------------------------------------
variable "enable_api_gateway_integration_response" {
  description = "Enable api gateway integration response usage"
  default     = false
}

variable "api_gateway_integration_response_rest_api_id" {
  description = "The ID of the associated REST API"
  default     = ""
}

variable "api_gateway_integration_response_resource_id" {
  description = "The API resource ID"
  default     = ""
}

variable "api_gateway_integration_response_http_method" {
  description = "The HTTP method (GET, POST, PUT, DELETE, HEAD, OPTIONS, ANY)"
  default     = ""
}

variable "api_gateway_integration_response_status_code" {
  description = "The HTTP status code"
  default     =  ""
}

variable "api_gateway_integration_response_selection_pattern" {
  description = "(Optional) Specifies the regular expression pattern used to choose an integration response based on the response from the backend. Setting this to - makes the integration the default one. If the backend is an AWS Lambda function, the AWS Lambda function error header is matched. For all other HTTP and AWS backends, the HTTP status code is matched."
  default     = null
}

variable "api_gateway_integration_response_response_templates" {
  description = "(Optional) A map specifying the templates used to transform the integration response body"
  default     = null
}

variable "api_gateway_integration_response_response_parameters" {
  description = "(Optional) A map of response parameters that can be read from the backend response. For example: response_parameters = { 'method.response.header.X-Some-Header' = 'integration.response.header.X-Some-Other-Header' }"
  default     = null
}

variable "api_gateway_integration_response_content_handling" {
  description = "(Optional) Specifies how to handle request payload content type conversions. Supported values are CONVERT_TO_BINARY and CONVERT_TO_TEXT. If this property is not defined, the response payload will be passed through from the integration response to the method response without modification."
  default     = null
}

#---------------------------------------------------
# AWS API Gateway response
#---------------------------------------------------
variable "enable_api_gateway_gateway_response" {
  description = "Enable api gateway gateway response usage"
  default     = false
}

variable "api_gateway_gateway_response_rest_api_id" {
  description = "The string identifier of the associated REST API."
  default     = ""
}

variable "api_gateway_gateway_response_response_type" {
  description = "(Required) The response type of the associated GatewayResponse."
  default     = ""
}

variable "api_gateway_gateway_response_status_code" {
  description = "(Optional) The HTTP status code of the Gateway Response."
  default     = null
}

variable "api_gateway_gateway_response_response_templates" {
  description = "(Optional) A map specifying the templates used to transform the response body."
  default     = null
}

variable "api_gateway_gateway_response_response_parameters" {
  description = "(Optional) A map specifying the parameters (paths, query strings and headers) of the Gateway Response."
  default     = null
}

#---------------------------------------------------
# AWS API Gateway domain name
#---------------------------------------------------
variable "enable_api_gateway_domain_name" {
  description = "Enable api gateway domain name usage"
  default     = false
}

variable "api_gateway_domain_name_domain_name" {
  description = "The fully-qualified domain name to register"
  default     = ""
}

variable "api_gateway_domain_name_security_policy" {
  description = "(Optional) The Transport Layer Security (TLS) version + cipher suite for this DomainName. The valid values are TLS_1_0 and TLS_1_2. Must be configured to perform drift detection."
  default     = null
}

variable "api_gateway_domain_name_certificate_arn" {
  description = "(Optional) The ARN for an AWS-managed certificate. AWS Certificate Manager is the only supported source. Used when an edge-optimized domain name is desired. Conflicts with certificate_name, certificate_body, certificate_chain, certificate_private_key, regional_certificate_arn, and regional_certificate_name."
  default     = null
}

variable "api_gateway_domain_name_certificate_name" {
  description = "(Optional) The unique name to use when registering this certificate as an IAM server certificate. Conflicts with certificate_arn, regional_certificate_arn, and regional_certificate_name. Required if certificate_arn is not set."
  default     = null
}

variable "api_gateway_domain_name_certificate_body" {
  description = "(Optional) The certificate issued for the domain name being registered, in PEM format. Only valid for EDGE endpoint configuration type. Conflicts with certificate_arn, regional_certificate_arn, and regional_certificate_name."
  default     = null
}

variable "api_gateway_domain_name_certificate_chain" {
  description = "(Optional) The certificate for the CA that issued the certificate, along with any intermediate CA certificates required to create an unbroken chain to a certificate trusted by the intended API clients. Only valid for EDGE endpoint configuration type. Conflicts with certificate_arn, regional_certificate_arn, and regional_certificate_name."
  default     = null
}

variable "api_gateway_domain_name_certificate_private_key" {
  description = "(Optional) The private key associated with the domain certificate given in certificate_body. Only valid for EDGE endpoint configuration type. Conflicts with certificate_arn, regional_certificate_arn, and regional_certificate_name."
  default     = null
}

variable "api_gateway_domain_name_regional_certificate_arn" {
  description = "(Optional) The ARN for an AWS-managed certificate. AWS Certificate Manager is the only supported source. Used when a regional domain name is desired. Conflicts with certificate_arn, certificate_name, certificate_body, certificate_chain, and certificate_private_key."
  default     = null
}

variable "api_gateway_domain_name_regional_certificate_name" {
  description = "(Optional) The user-friendly name of the certificate that will be used by regional endpoint for this domain name. Conflicts with certificate_arn, certificate_name, certificate_body, certificate_chain, and certificate_private_key."
  default     = null
}

variable "api_gateway_domain_name_endpoint_configuration" {
  description = "(Optional) Configuration block defining API endpoint information including type."
  default     = []
}

#---------------------------------------------------
# AWS API Gateway client certificate
#---------------------------------------------------
variable "enable_api_gateway_client_certificate" {
  description = "Enable api gateway client certificate usage"
  default     = false
}

variable "api_gateway_client_certificate_description" {
  description = "(Optional) The description of the client certificate."
  default     = null
}

#---------------------------------------------------
# AWS API Gateway documentation part
#---------------------------------------------------
variable "enable_api_gateway_documentation_part" {
  description = "Enable api gateway documentation part usage"
  default     = false
}

variable "api_gateway_documentation_part_rest_api_id" {
  description = "The ID of the associated Rest API"
  default     = ""
}

variable "api_gateway_documentation_part_properties" {
  description = "(Required) A content map of API-specific key-value pairs describing the targeted API entity. The map must be encoded as a JSON string, e.g. Only Swagger-compliant key-value pairs can be exported and, hence, published."
  default     = null
}

variable "api_gateway_documentation_part_location_type" {
  description = "(Required) The type of API entity to which the documentation content applies. e.g. API, METHOD or REQUEST_BODY"
  default     = "METHOD"
}

variable "api_gateway_documentation_part_location_method" {
  description = "(Optional) The HTTP verb of a method. The default value is * for any method."
  default     = null
}

variable "api_gateway_documentation_part_location_name" {
  description = "(Optional) The name of the targeted API entity."
  default     = null
}

variable "api_gateway_documentation_part_location_path" {
  description = "(Optional) The URL path of the target. The default value is / for the root resource."
  default     = null
}

variable "api_gateway_documentation_part_location_status_code" {
  description = "(Optional) The HTTP status code of a response. The default value is * for any status code."
  default     = null
}

#---------------------------------------------------
# AWS API Gateway documentation version
#---------------------------------------------------
variable "enable_api_gateway_documentation_version" {
  description = "Enable api gateway documentation version usage"
  default     = false
}

variable "api_gateway_documentation_version_rest_api_id" {
  description = "The ID of the associated Rest API"
  default     = ""
}

variable "api_gateway_documentation_version_version" {
  description = "The version identifier of the API documentation snapshot."
  default     = ""
}

variable "api_gateway_documentation_version_description" {
  description = "(Optional) The description of the API documentation version."
  default     = null
}

#---------------------------------------------------
# AWS API Gateway deployment
#---------------------------------------------------
variable "enable_api_gateway_deployment" {
  description = "Enable api gateway deployment usage"
  default     = false
}

variable "api_gateway_deployment_rest_api_id" {
  description = "The ID of the associated REST API"
  default     = ""
}

variable "api_gateway_deployment_stage_name" {
  description = "(Optional) The name of the stage. If the specified stage already exists, it will be updated to point to the new deployment. If the stage does not exist, a new one will be created and point to this deployment."
  default     = null
}

variable "api_gateway_deployment_description" {
  description = "(Optional) The description of the deployment"
  default     = null
}

variable "api_gateway_deployment_stage_description" {
  description = "(Optional) The description of the stage"
  default     = null
}

variable "api_gateway_deployment_variables" {
  description = "(Optional) A map that defines variables for the stage"
  default     = null
}

#---------------------------------------------------
# AWS API Gateway stage
#---------------------------------------------------
variable "enable_api_gateway_stage" {
  description = "Enable api gateway stage usage"
  default     = false
}

variable "api_gateway_stage_rest_api_id" {
  description = "The ID of the associated REST API"
  default     = ""
}

variable "api_gateway_stage_deployment_id" {
  description = "The ID of the deployment that the stage points to"
  default     = ""
}

variable "api_gateway_stage_stage_name" {
  description = "The name of the stage"
  default     = ""
}

variable "api_gateway_stage_description" {
  description = "(Optional) The description of the stage"
  default     = null
}

variable "api_gateway_stage_cache_cluster_enabled" {
  description = "(Optional) Specifies whether a cache cluster is enabled for the stage"
  default     = null
}

variable "api_gateway_stage_cache_cluster_size" {
  description = "(Optional) The size of the cache cluster for the stage, if enabled. Allowed values include 0.5, 1.6, 6.1, 13.5, 28.4, 58.2, 118 and 237."
  default     = null
}

variable "api_gateway_stage_client_certificate_id" {
  description = "(Optional) The identifier of a client certificate for the stage."
  default     = null
}

variable "api_gateway_stage_documentation_version" {
  description = "(Optional) The version of the associated API documentation"
  default     = null
}

variable "api_gateway_stage_variables" {
  description = "(Optional) A map that defines the stage variables"
  default     = null
}

variable "api_gateway_stage_xray_tracing_enabled" {
  description = "(Optional) Whether active tracing with X-ray is enabled. Defaults to false."
  default     = false
}

variable "api_gateway_stage_access_log_settings" {
  description = "(Optional) Enables access logs for the API stage."
  default     = []
}

#---------------------------------------------------
# AWS API Gateway base path mapping
#---------------------------------------------------
variable "enable_api_gateway_base_path_mapping" {
  description = "Enable api gateway base path mapping usage"
  default     = false
}

variable "api_gateway_base_path_mapping_api_id" {
  description = "The id of the API to connect."
  default     = ""
}

variable "api_gateway_base_path_mapping_domain_name" {
  description = "The already-registered domain name to connect the API to."
  default     = ""
}

variable "api_gateway_base_path_mapping_stage_name" {
  description = "(Optional) The name of a specific deployment stage to expose at the given path. If omitted, callers may select any stage by including its name as a path element after the base path."
  default     = null
}

variable "api_gateway_base_path_mapping_base_path" {
  description = "(Optional) Path segment that must be prepended to the path when accessing the API via this mapping. If omitted, the API is exposed at the root of the given domain."
  default     = null
}

#---------------------------------------------------
# AWS API Gateway method settings
#---------------------------------------------------
variable "enable_api_gateway_method_settings" {
  description = "Enable api gateway method settings usage"
  default     = false
}

variable "api_gateway_method_settings_rest_api_id" {
  description = "The ID of the REST API"
  default     = ""
}

variable "api_gateway_method_settings_stage_name" {
  description = "The name of the stage"
  default     = ""
}

variable "api_gateway_method_settings_method_path" {
  description = "(Required) Method path defined as {resource_path}/{http_method} for an individual method override, or */* for overriding all methods in the stage."
  default     = ""
}

variable "api_gateway_method_settings_settings" {
  description = "(Required) The settings block"
  default     = []
}

#---------------------------------------------------
# AWS API Gateway usage plan
#---------------------------------------------------
variable "enable_api_gateway_usage_plan" {
  description = "Enable api gateway usage plan usage"
  default     = false
}

variable "api_gateway_usage_plan_name" {
  description = "The name of the usage plan."
  default     = ""
}

variable "api_gateway_usage_plan_description" {
  description = "(Optional) The description of a usage plan."
  default     = null
}

variable "api_gateway_usage_plan_product_code" {
  description = "(Optional) The AWS Markeplace product identifier to associate with the usage plan as a SaaS product on AWS Marketplace."
  default     = null
}

variable "api_gateway_usage_plan_api_stages" {
  description = "(Optional) The associated API stages of the usage plan."
  default     = []
}

variable "api_gateway_usage_plan_quota_settings" {
  description = "(Optional) The quota settings of the usage plan."
  default     = []
}

variable "api_gateway_usage_plan_throttle_settings" {
  description = "(Optional) The throttling limits of the usage plan."
  default     = []
}

#---------------------------------------------------
# AWS API Gateway usage plan key
#---------------------------------------------------
variable "enable_api_gateway_usage_plan_key" {
  description = "Enable api gateway usage plan key usage"
  default     = false
}

variable "api_gateway_usage_plan_key_key_id" {
  description = "The identifier of the API key resource."
  default     = ""
}

variable "api_gateway_usage_plan_key_key_type" {
  description = "(Required) The type of the API key resource. Currently, the valid key type is API_KEY."
  default     = "API_KEY"
}

variable "api_gateway_usage_plan_key_usage_plan_id" {
  description = "The Id of the usage plan resource representing to associate the key to."
  default     = ""
}
