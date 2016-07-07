import Foundation

/**
 NSURL Convertible implementation
 */
extension URL: Convertible {
    /**
     Create a NSURL from Mapper

     - parameter value: The object (or nil) passed from Mapper

     - throws: MapperError.ConvertibleError if the passed value is not a String
     - throws: MapperError.CustomError      if the passed value a String but the NSURL initializer returns nil

     - returns: The created NSURL
     */
    
    public static func fromMap(_ value: AnyObject?) throws -> URL {
        guard let string = value as? String else {
            throw MapperError.convertibleError(value: value, type: String.self)
        }

        if let URL = URL(string: string) {
            return URL
        }

        throw MapperError.customError(field: nil, message: "'\(string)' is not a valid NSURL")
    }
}
