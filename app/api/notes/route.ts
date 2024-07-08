import DateHelper from '@/app/utils/date_helper';
import { PrismaClient } from '@prisma/client';
import { NextResponse } from 'next/server';

const prisma = new PrismaClient();

export async function GET(req: Request) {
  const notes = await prisma.note.findMany();
  return NextResponse.json(notes, { status: 200 });
}

export async function POST(req: Request) {
  const { title, content } = await req.json();  
    
  
  const note = await prisma.note.create({ 
    data: {
      title,
      content,
      created_at: DateHelper.getCurrentDate(),
    }
    });
  return NextResponse.json(note, { status: 201 });
}

