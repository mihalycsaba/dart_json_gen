# Dart cli json generator

**Generate json data with a simple syntax**

## Inspiration

[http://www.objgen.com/json?demo=true](http://www.objgen.com/json?demo=true)

## Usage

Default type is string

`name = Jane Doe`

Specify types (number, date, boolean) after property name. 

`id n = 32145`

`when d = 2012-04-22`

`ok b = false`

Use comma for type arrays

`distance n = 5.8, 3`

Tabs or double spaces for complex objects

```
  birth d = 2000-01-01
  name = John Doe
  details
    phone = 800-123-4567
    personal
      children n = 0
      married b = true
```

Use `[` and index number after property name for object arrays

```
fast[0
  aks = afdsaf
  sd = asas
  sda = sssssssss
fast[1
  aks = sdfsd
  sd = asas
```

## TODO

Add comments to the input text
