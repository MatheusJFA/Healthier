-- CreateEnum
CREATE TYPE "Sex" AS ENUM ('MALE', 'FEMALE');

-- CreateEnum
CREATE TYPE "CarbsIntake" AS ENUM ('LOW_CARB', 'MODERATE_CARB', 'HIGH_CARB');

-- CreateEnum
CREATE TYPE "Diet" AS ENUM ('MAINTENANCE', 'CUTTING', 'BULKING');

-- CreateEnum
CREATE TYPE "DietType" AS ENUM ('NO_DIET', 'PESCETARIAN', 'LACTO_VEGETARIAN', 'OVO_VEGETARIAN', 'VEGAN', 'PALEO', 'PRIMAL', 'VEGETARIAN', 'KETOGENIC', 'WHOLE_30');

-- CreateEnum
CREATE TYPE "Intolerances" AS ENUM ('NONE', 'DAIRY', 'EGG', 'GLUTEN', 'PEANUT', 'SESAME', 'SEAFOOD', 'SHELLFISH', 'SOY', 'SULFITE', 'TREE_NUT', 'WHEAT', 'GRAINS', 'CORN');

-- CreateTable
CREATE TABLE "users" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "birthdate" TIMESTAMP(3) NOT NULL,
    "sex" "Sex" NOT NULL DEFAULT 'MALE',
    "image" TEXT,
    "isEmailVerified" BOOLEAN NOT NULL DEFAULT false,
    "level" INTEGER NOT NULL DEFAULT 1,
    "exp" BIGINT NOT NULL DEFAULT 0,
    "height" DECIMAL(65,30) NOT NULL,
    "weight" DECIMAL(65,30) NOT NULL,
    "weightTracker" DECIMAL(65,30)[],
    "carbsIntake" "CarbsIntake" NOT NULL DEFAULT 'MODERATE_CARB',
    "dietType" "DietType" NOT NULL DEFAULT 'NO_DIET',
    "diet" "Diet" NOT NULL DEFAULT 'MAINTENANCE',
    "intolerances" "Intolerances"[],
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" TIMESTAMP(3),
    "updatedAt" TIMESTAMP(3),

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "intakes" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "proteins" INTEGER NOT NULL,
    "fats" INTEGER NOT NULL,
    "carbs" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" TIMESTAMP(3),
    "updatedAt" TIMESTAMP(3),

    CONSTRAINT "intakes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tokens" (
    "id" TEXT NOT NULL,
    "jwt" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "expires" BIGINT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" TIMESTAMP(3),
    "updatedAt" TIMESTAMP(3),

    CONSTRAINT "tokens_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "intakes_userId_key" ON "intakes"("userId");

-- AddForeignKey
ALTER TABLE "intakes" ADD CONSTRAINT "intakes_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tokens" ADD CONSTRAINT "tokens_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
