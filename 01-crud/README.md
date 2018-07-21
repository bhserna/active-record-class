# Create Read Update and Delete data (CRUD)

* [Referencia](#referencia)
* [Ejercicios en la consola](#ejercicios-en-la-consola)
* [Proyecto](#proyecto)

## Referencia

### ¿Como crear un modelo usando el generador de Rails?

`rails generate model User name birthday:date`

* http://guides.rubyonrails.org/getting_started.html#creating-the-article-model
* http://api.rubyonrails.org/classes/ActiveRecord/ConnectionAdapters/SchemaStatements.html#method-i-create_table

### ¿Como correr una migración?

`rails db:migrate`

* http://guides.rubyonrails.org/getting_started.html#running-a-migration

### ¿Como crear un record en la base de datos?

```ruby
User.create(name: "Benito", birthday: Date.new(1987, 9, 21))

user = User.new(name: "Benito", birthday: Date.new(1987, 9, 21))
user.save
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

user = User.find(id)
user.name = "Benito"
user.save
```

* http://guides.rubyonrails.org/active_record_basics.html#update

### ¿Como borrar un record de la base de datos?

```ruby
user = User.find(id)
user.destroy
```

* http://guides.rubyonrails.org/active_record_basics.html#delete

### ¿Como agregar un nuevo atributo a un modelo?

Genera una migración para agregar el atributo

`rails generate migration add_country_to_users countr`

* http://guides.rubyonrails.org/active_record_migrations.html#creating-a-standalone-migration

## Ejercicios en la consola

1. Crea 2 usuarios diferentes usando `User.new` y `User#save`.

```console
nombre = María, fecha = 10-sep-2000, país = México
nombre = Pedro, fecha = 9-may-1990, país = Colombia
```

2. Crea 2 usuarios diferentes usando `User.create`.

```console
nombre = Ramón, fecha = 1-mar-1980, país = México
nombre = Florinda, fecha = 9-feb-2003, país = Perú
```

3. Actualiza la fecha de nacimiento de Ramón al `1-mar-1981` usando `User#update`.
4. Actualiza el país de María a `Chile` usando `User#save`.
5. Actualiza el país de todos los usuarios a `México` usando `User.update_all`.
6. Crea usuarios a partir del siguiente arreglo de hashes.

```ruby
[
  { name: "Jose", birthday: Date.new(2000, 10, 10), country: "México" },
  { name: "Juan", birthday: Date.new(1987, 7, 3), country: "Colombia" },
  { name: "Ricardo", birthday: Date.new(1999, 5, 4), country: "Colombia" },
  { name: "Juana", birthday: Date.new(2001, 4, 9), country: "México" },
  { name: "Josefa", birthday: Date.new(1993, 10, 8), country: "México" }
]
```

7. Encuentra a todos los usuarios que son de México usando `User.where`.
8. Encuetra al usuario de nombre Juana y cambia su nombre a Juanita.
9. Agrega a la tabla de usuarios un nuevo atributo `email`.
10. Actualiza el `email` de todos los usuarios poniendo `user@example.com`.
11. Actualiza el `email` de todos los usuarios con:

```ruby
"#{user.name}@example.com"

# Es decir ahora el correo sería
# Jose@example.com
# Juanita@example.com
# ... según sea el nombre del usuario
```

12. Encuentra a un usuario (usando `find_by`) de Colombia y ¡bórralo!.
13. Encuentra a todos los usuarios (usando `where`) de Colombia y ¡bórralos!.


## Proyecto

Crear un sistema para administrar los libros en una biblioteca.

### Consideraciones

Por ahora no trabajaremos con los controladores y vistas, por lo que el
sistema lo "expondremos" usando un módulo `Catalog` en la carpeta
`app/models` y probando las funciones dentro de `rails console`.

Ej..

```ruby
module Catalog
  def self.register_book(attrs)
  end
end
```

### El sistema nos debe permitir...


### 1. Registrar libros

Con "Nombre", "Nombre del autor", "ISBN", "Año de publicación" y "Número de copias"

Ej.

```
attrs = {
  name: "Cien Años de Soledad",
  author_name: "Gabriel García Marquez"
  isbn: 12341234,
  publicated_on: Date.new(2000, 10, 20),
  copies_count: 30
}

Catalog.register_book(attrs)
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

Catalog.update_book(book_id, attrs)
```

### 5. Poder eliminar un libro con su id.

Ej.

```
Catalog.delete_book(book_id)
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

### 11. Validar que al registrar un libro este tenga nombre.

Es decir que si alguién intenta registrar un libro sin nombre, el
programa debe regresar un mensaje de error.

Ej.

```ruby
attrs = {}
Catalog.register_book(attrs)
=> "Error: No se puede registrar un libro sin nombre"
```

### 12. Validar que al actualizar un libro no se pueda borrar el nombre.

Ej.

```ruby
attrs = {author_name: "Mario Benedetti"}
Catalog.update_book(book_id, attrs)
# Aquí solo debe de actualizarse el nombre del autór

attrs = {name: nil, author_name: "Mario Benedetti"}
Catalog.update_book(book_id, attrs)
# Aquí también solo debe de actualizarse el nombre del autór.
```
