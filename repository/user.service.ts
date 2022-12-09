import { IUser } from "~~/types/IUser";
import prisma from "../prisma/client";


export async function createUser(user: IUser) {
    return await prisma.user.create({
        data: {
            name: user.name,
            email: user.email,
            password: user.password,
            birthdate: user.birthdate,
            sex: user.sex,
            image: user.image,
            level: user.level,
            exp: user.exp,
            height: user.height,
            weight: user.weight,
            carbsIntake: user.carbsIntake,
            dietType: user.dietType,
            diet: user.diet,
        }
    })
}

export async function findUserByEmail(email: string) {
    return await prisma.user.findFirst({
        where: {
            email: email, 
            deletedAt: null
        },
        include: {
            intake: true,
            tokens: true
        }
    })
}

export async function findUserById(id: string) {
    return await prisma.user.findFirst({
        where: {
            id: id,
            deletedAt: null
        },
        include: {
            intake: true,
            tokens: true
        }
    })
}

export async function updateUserById(id: string, user: IUser) {
    return await prisma.user.update({
        where: {
            id: id
        },
        data: {
            name: user.name,
            email: user.email,
            password: user.password,
            birthdate: user.birthdate,
            sex: user.sex,
            image: user.image,
            level: user.level,
            exp: user.exp,
            height: user.height,
            weight: user.weight,
            carbsIntake: user.carbsIntake,
            dietType: user.dietType,
            diet: user.diet
        }
    });
}

export async function deleteUserById(id: string) {
    return await prisma.user.update({
        where: {
            id: id
        }, 
        data: {
            deletedAt: new Date()
        }
    })
}