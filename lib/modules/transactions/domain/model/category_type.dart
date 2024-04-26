// ignore_for_file: no_default_cases

import 'package:flutter/material.dart';

enum CategoryType {
  // Categorias de gastos
  // Alimentação
  food,
  // Beleza e Cuidados Pessoais
  beautyAndPersonalCare,
  // Moda e Vestuário
  fashionAndClothing,
  // Saúde e Fitness
  healthAndFitness,
  // Tecnologia
  technology,
  // Casa e Decoração
  homeAndDecoration,
  // Entretenimento
  entertainment,
  // Educação
  education,
  // Viagens
  travel,
  // Finanças
  finance,
  // Automóveis
  automobiles,
  // Esportes
  sports,
  // Animais de Estimação
  pets,
  // Arte e Cultura
  artsAndCulture,
  // Trabalho e Carreira
  workAndCareer,

  // Categorias de recebimento
  // Investimentos
  investments,
  // Salario
  wage,
  // Presente
  gift,
  // Premio
  award,
  // Restituição
  restitution,
  // Outros
  others
}

extension CategoryExtension on CategoryType {
  String get displayName {
    switch (this) {
      case CategoryType.food:
        return 'Alimentação';
      case CategoryType.beautyAndPersonalCare:
        return 'Beleza e Cuidados Pessoais';
      case CategoryType.fashionAndClothing:
        return 'Moda e Vestuário';
      case CategoryType.healthAndFitness:
        return 'Saúde e Fitness';
      case CategoryType.technology:
        return 'Tecnologia';
      case CategoryType.homeAndDecoration:
        return 'Casa e Decoração';
      case CategoryType.entertainment:
        return 'Entretenimento';
      case CategoryType.education:
        return 'Educação';
      case CategoryType.travel:
        return 'Viagens';
      case CategoryType.finance:
        return 'Finanças';
      case CategoryType.automobiles:
        return 'Automóveis';
      case CategoryType.sports:
        return 'Esportes';
      case CategoryType.pets:
        return 'Animais de Estimação';
      case CategoryType.artsAndCulture:
        return 'Arte e Cultura';
      case CategoryType.workAndCareer:
        return 'Trabalho e Carreira';
      case CategoryType.investments:
        return 'Investimentos';
      case CategoryType.wage:
        return 'Salário';
      case CategoryType.gift:
        return 'Presente';
      case CategoryType.award:
        return 'Prêmio';
      case CategoryType.restitution:
        return 'Restituição';
      case CategoryType.others:
        return 'Outros';
    }
  }

  String get description {
    switch (this) {
      case CategoryType.food:
        return 'Categoria relacionada a alimentos e restaurantes.';
      case CategoryType.beautyAndPersonalCare:
        return 'Produtos e serviços relacionados à beleza, cuidados com a pele e higiene pessoal.';
      case CategoryType.fashionAndClothing:
        return 'Roupas, acessórios e moda em geral.';
      case CategoryType.healthAndFitness:
        return 'Saúde física, bem-estar e exercícios físicos.';
      case CategoryType.technology:
        return 'Produtos eletrônicos, gadgets e inovações tecnológicas.';
      case CategoryType.homeAndDecoration:
        return 'Itens de decoração, móveis e utensílios domésticos.';
      case CategoryType.entertainment:
        return 'Atividades de lazer, jogos, filmes, música, etc.';
      case CategoryType.education:
        return 'Aprendizado, cursos, livros e educação em geral.';
      case CategoryType.travel:
        return 'Destinos, hospedagens, turismo e viagens em geral.';
      case CategoryType.finance:
        return 'Gestão de dinheiro, investimentos e finanças pessoais.';
      case CategoryType.automobiles:
        return 'Veículos, manutenção automotiva e transporte.';
      case CategoryType.sports:
        return 'Esportes, atividades físicas e competições esportivas.';
      case CategoryType.pets:
        return 'Cuidados e produtos para animais de estimação.';
      case CategoryType.artsAndCulture:
        return 'Eventos culturais, exposições, arte e manifestações culturais.';
      case CategoryType.workAndCareer:
        return 'Emprego, carreira profissional e desenvolvimento de habilidades.';
      case CategoryType.investments:
        return 'Investimentos na bolsa de valores';
      case CategoryType.wage:
        return 'Recebimento salário';
      case CategoryType.gift:
        return 'Dinheiro ganho de presente';
      case CategoryType.award:
        return 'Dinheiro ganho de jogos prêmio';
      case CategoryType.restitution:
        return 'Devolução de valores gastos restituição';
      case CategoryType.others:
        return 'Outros';
    }
  }

  IconData get icon {
    switch (this) {
      case CategoryType.food:
        return Icons.restaurant;
      case CategoryType.beautyAndPersonalCare:
        return Icons.spa;
      case CategoryType.fashionAndClothing:
        return Icons.shopping_bag;
      case CategoryType.healthAndFitness:
        return Icons.fitness_center;
      case CategoryType.technology:
        return Icons.devices;
      case CategoryType.homeAndDecoration:
        return Icons.home;
      case CategoryType.entertainment:
        return Icons.local_movies;
      case CategoryType.education:
        return Icons.school;
      case CategoryType.travel:
        return Icons.airplanemode_active;
      case CategoryType.finance:
        return Icons.attach_money;
      case CategoryType.automobiles:
        return Icons.directions_car;
      case CategoryType.sports:
        return Icons.sports_soccer;
      case CategoryType.pets:
        return Icons.pets;
      case CategoryType.artsAndCulture:
        return Icons.palette;
      case CategoryType.workAndCareer:
        return Icons.work;
      case CategoryType.investments:
        return Icons.trending_up;
      case CategoryType.wage:
        return Icons.attach_money;
      case CategoryType.gift:
        return Icons.redeem;
      case CategoryType.award:
        return Icons.new_releases;
      case CategoryType.restitution:
        return Icons.savings;
      case CategoryType.others:
        return Icons.dynamic_feed;
    }
  }

  Color get color {
    switch (this) {
      case CategoryType.food:
        return Colors.red;
      case CategoryType.beautyAndPersonalCare:
        return Colors.pink;
      case CategoryType.fashionAndClothing:
        return Colors.blue;
      case CategoryType.healthAndFitness:
        return Colors.green;
      case CategoryType.technology:
        return Colors.orange;
      case CategoryType.homeAndDecoration:
        return Colors.purple;
      case CategoryType.entertainment:
        return Colors.yellow;
      case CategoryType.education:
        return Colors.teal;
      case CategoryType.travel:
        return Colors.indigo;
      case CategoryType.finance:
        return Colors.brown;
      case CategoryType.automobiles:
        return Colors.deepOrange;
      case CategoryType.sports:
        return Colors.deepPurple;
      case CategoryType.pets:
        return Colors.amber;
      case CategoryType.artsAndCulture:
        return Colors.lightBlue;
      case CategoryType.workAndCareer:
        return Colors.cyan;
      case CategoryType.investments:
        return Colors.purple.shade900;
      case CategoryType.wage:
        return Colors.green.shade800;
      case CategoryType.gift:
        return Colors.yellow.shade800;
      case CategoryType.award:
        return Colors.yellow.shade900;
      case CategoryType.restitution:
        return Colors.green.shade500;
      case CategoryType.others:
        return Colors.red.shade800;
    }
  }

  bool get isReceived {
    switch (this) {
      case CategoryType.investments ||
            CategoryType.wage ||
            CategoryType.gift ||
            CategoryType.award ||
            CategoryType.restitution ||
            CategoryType.others:
        return true;
      default:
        return false;
    }
  }
}
