
Pod::Spec.new do |spec|
    spec.name         = "SimpleNetworkLayer"
    spec.version      = "1.0.7"
    spec.summary      = "This is fast NetworkLayer setup."
    spec.description  = "This is fast NetworkLayer setup you can use to set your network layer easly."

    spec.homepage     = "https://github.com/Ahmed-Elsman/NetworkLayer"
    spec.license      = "MIT"
    spec.author             = { "Elsman" => "ahmedelsman0@gmail.com" }
    spec.platform     = :ios, "11.0"
    spec.source       = { :git => "https://github.com/Ahmed-Elsman/NetworkLayer.git", :tag => spec.version.to_s }
    spec.source_files  = "NetworkLayer/NetworkLayer/**/*.{h,m,swift}"
    spec.exclude_files = "Classes/Exclude"
    spec.dependency "Alamofire", "~>5.6.1"
    spec.dependency "NVActivityIndicatorView", "~>4.7.0"
    spec.dependency "SwiftMessages", "~>9.0.6"
    spec.swift_versions =  "5.0"
end
