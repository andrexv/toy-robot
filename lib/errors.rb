# Defining Custom Errors to raise
class MissingFileError < StandardError; end
class InvalidInputError < StandardError; end
class UndefinedActionError < StandardError; end