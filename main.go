package main

import (
	"fmt"
	"github.com/gofiber/fiber/v2"
	"os"
)

func main() {

	app := fiber.New()

	app.Get("/example", func(c *fiber.Ctx) error {
		fmt.Println("Bu bir test println satırıdır")
		return c.Send([]byte("Success"))
	})

	err := app.Listen(fmt.Sprintf(":%s", os.Getenv("APP_PORT")))
	if err != nil {
		panic(fmt.Sprintf("Server not listen %s", err.Error()))
	}
}
