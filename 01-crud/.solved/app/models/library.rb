module Library
  def self.register_book(attrs)
    Book.create(attrs)
  end

  def self.find_book(id)
    book = Book.find(id)
    BookFormatter.format(book)
  end

  def self.find_book_by_isbn(isbn)
    book = Book.find_by(isbn: isbn)
    BookFormatter.format(book)
  end

  def self.update_book(id, attrs)
    book = Book.find(id)
    book.update(attrs)
  end

  def self.delete_book(id)
    book = Book.find(id)
    book.destroy
  end

  class BookFormatter
    def self.format(book)
      """
      ID: #{book.id}
      ISBN: #{book.isbn}
      Nombre: #{book.name}
      Autor: #{book.author_name}
      Año de publicación: #{book.publication_date}
      Número de copias: #{book.copies_count}
      """.strip
    end
  end
end
