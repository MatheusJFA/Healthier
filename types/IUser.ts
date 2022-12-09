import { CarbsIntake, Diet, DietType, Sex } from "@prisma/client"

export interface IUser {
    name: string
    email: string
    password: string
    birthdate: string
    sex: Sex
    image: string
    level: number
    exp: number
    height: number
    weight: number
    carbsIntake: CarbsIntake
    dietType: DietType
    diet: Diet
}