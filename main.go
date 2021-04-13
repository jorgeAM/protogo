package main

import (
	"fmt"
	"log"

	"github/com/jorgeAM/protogo/contactspb"

	"google.golang.org/protobuf/proto"
)

func main() {
	p := contactspb.Person{
		Id:    1234,
		Name:  "John Doe",
		Email: "jdoe@example.com",
		Phones: []*contactspb.Person_PhoneNumber{
			{Number: "555-4321", Type: contactspb.Person_HOME},
		},
	}

	bytes, err := proto.Marshal(&p)

	if err != nil {
		log.Fatalln("Failed to encode address book:", err)
	}

	fmt.Println(string(bytes))
}
