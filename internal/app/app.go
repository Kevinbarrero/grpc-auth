package app

import (
	grpcapp "grpc-auth/internal/app/grpc"
	"grpc-auth/internal/services/auth"
	"grpc-auth/storage/sqlite"
	"log/slog"
	"time"
)

type App struct {
	GRPCSvr *grpcapp.App
}

func New(log *slog.Logger, grpcPort int, storagePath string, tokenTTL time.Duration) *App {
	storage, err := sqlite.New(storagePath)
	if err != nil {
		panic(err)
	}
	authService := auth.New(log, storage, storage, storage, tokenTTL)

	grpcApp := grpcapp.New(log, grpcPort, authService)
	return &App{
		GRPCSvr: grpcApp,
	}
}
