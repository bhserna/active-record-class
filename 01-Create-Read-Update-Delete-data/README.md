# Create Read Update and Delete data (CRUD)

## Tarea

Crear un sistema para administrar los libros en una biblioteca.

## Consideraciones

Por ahora no trabajaremos con los controladores y vistas, por lo que el
sistema lo "expondremos" usando un módulo `Library` en la carpeta `/lib`
y probando las funciones dentro de `bin/rails console`.


## El sistema nos debe permitir...


### 1. Registrar libros

Con "Nombre", "Nombre del autor", "ISBN", "Año de publicación" y "Número de copias"

Ej.

```
attrs = {
  name: "Cien Años de Soledad",
  author_name: "Gabriel García Marquez"
  # ...
}

Library.register_book(attrs)
```

### 2. Poder buscar un libro por el id del registro

Regresando la información del libro con el siguiente formato:

```console
ID: 1234
ISBN: 9786070728792
Nombre: Cien Años de Soledad
Autor: Gabriel García Marquez
Año de publicación: 2000
Número de copias: 5
```

### 3. Poder buscar un libro por ISBN

Regresar el libro con el mismo formato.

### 4. Poder actualizar los atributos de un libro

Pasando su id y los atributos que queremos modificar.

Ej.

```
attrs = {
  name: "Cien Años de Soledad",
  author_name: "Gabriel García Marquez"
  # ...
}

Library.update_book(book_id, attrs)
```

### 5. Poder eliminar un libro con su id.

Ej.

```
Library.delete_book(book_id)
```

### 6. Regresar una lista de todos los libros

Usando el siguiente formato:

```console
ID: 123 - (0439554934) Harry Potter and the Philosopher's Stone, por J.K. Rowling - Año: 2000
ID: 324 - (9786070728792) Cien Años de Soledad, por Gabriel García Marquez - Año: 1999
```

### 7. Regresar una lista libros para diferentes solicitudes.

1. Todos los libros ordenados por año de publicación ascendente.
2. Todos los libros ordenados por año de publicación descendente.
3. Todos los libros publicados en cierto año.
4. Todos los libros de cierto autor.

### 8. Regresar una lista con los nombres de todos los autores de los que tenemos registro.

Ej.

```console
- J.K. Rowling
- Gabriel García Marquez
```

### 9. Regresar una lista con todos los ISBN que contamos de forma ascendente.

```console
- 0439554934
- 9786070728792
```

### 10. Regresar una lista con los nombres de todos los autores y el número de libros (no copias) con los que contamos de ellos.

Ej.

```console
- J.K. Rowling (7)
- Gabriel García Marquez (5)
```


## Referencia

### ¿Como crear un modelo usando el generador de Rails?

`bin/rails generate model User name birthday:date`

* http://guides.rubyonrails.org/getting_started.html#creating-the-article-model

### ¿Como correr una migración?

`bin/rails db:migrate`

* http://guides.rubyonrails.org/getting_started.html#running-a-migration

### ¿Como crear un record en la base de datos?

```ruby
User.create(name: "Benito", birthday: Date.new(1987, 9, 21))
```

* http://guides.rubyonrails.org/active_record_basics.html#create

### ¿Como encontrar records en la base de datos?

```ruby
User.find(id)
User.find_by(id: id)
User.find_by(name: "Benito")
User.all
User.where(name: "Benito")
```

* http://guides.rubyonrails.org/active_record_basics.html#read
* http://guides.rubyonrails.org/active_record_querying.html#retrieving-objects-from-the-database
* http://guides.rubyonrails.org/active_record_querying.html#retrieving-a-single-object

### ¿Como encontrar actualizar un record en la base de datos?

```ruby
user = User.find(id)
user.update(name: "Benito")
```

* http://guides.rubyonrails.org/active_record_basics.html#update

### ¿Como borrar un record de la base de datos?

```ruby
user = User.find(id)
user.destroy
```

* http://guides.rubyonrails.org/active_record_basics.html#delete
