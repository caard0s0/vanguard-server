package main

import (
	"database/sql"
	"log"

	"github.com/caard0s0/vanguard-server/configs"
	_ "github.com/caard0s0/vanguard-server/docs"
	"github.com/caard0s0/vanguard-server/internal/api"
	db "github.com/caard0s0/vanguard-server/internal/database/sqlc"
	_ "github.com/lib/pq"
)

// @title						Vanguard API Documentation
// @version					1.0.0
// @description				This is the Vanguard API. All features available in this application are documented below.
// @contact.email				cardoso.business.ctt@gmail.com
// @securityDefinitions.apiKey	BearerAuth
// @in							header
// @name						Authorization
func main() {
	config, err := configs.LoadConfig(".")
	if err != nil {
		log.Fatal("cannot read config:", err)
	}

	conn, err := sql.Open(config.DBDriver, config.DBSource)
	if err != nil {
		log.Fatal("cannot connect to db:", err)
	}

	store := db.NewStore(conn)
	server, err := api.NewServer(config, store)
	if err != nil {
		log.Fatal("cannot create server", err)
	}

	err = server.Start(config.HttpServerAddress)
	if err != nil {
		log.Fatal("cannot start server:", err)
	}
}
