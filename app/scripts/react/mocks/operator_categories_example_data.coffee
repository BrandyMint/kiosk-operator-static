###*global OperatorCategoriesService ###

# Monkey-patch the service to setup mock data
window.OperatorCategoriesService = _.extend window.OperatorCategoriesService, {
  mockMode: true
  mockData:
    [
      {
        "id": 313,
        "name": "Браслет-нить",
        "full_name": "Браслет-нить",
        "parent_id": null,
        "updated_at": "2014-09-28T23:09:21.750+04:00",
        "position": 12,
        "has_children?": false,
        "children": [],
        "products_count": 144
      },
      {
        "id": 318,
        "name": "под шеей",
        "full_name": "под шеей",
        "parent_id": null,
        "updated_at": "2014-10-02T18:26:11.364+04:00",
        "position": 7,
        "has_children?": true,
        "children": [
          {
            "id": 321,
            "name": "Под под шеей",
            "full_name": "под шеей/Под под шеей",
            "parent_id": 318,
            "updated_at": "2014-10-02T19:17:01.806+04:00",
            "position": 4,
            "has_children?": false,
            "children": [],
            "products_count": 0
          }
        ],
        "products_count": 0
      },
      {
        "id": 321,
        "name": "Под под шеей",
        "full_name": "под шеей/Под под шеей",
        "parent_id": 318,
        "updated_at": "2014-10-02T19:17:01.806+04:00",
        "position": 4,
        "has_children?": false,
        "children": [],
        "products_count": 0
      },
      {
        "id": 288,
        "name": "Украшения на тело-1",
        "full_name": "Украшения на тело-1",
        "parent_id": null,
        "updated_at": "2014-10-05T13:37:55.545+04:00",
        "position": 37,
        "has_children?": true,
        "children": [
          {
            "id": 289,
            "name": "Анклет",
            "full_name": "Украшения на тело-1/Анклет",
            "parent_id": 288,
            "updated_at": "2014-09-28T23:07:35.809+04:00",
            "position": 36,
            "has_children?": false,
            "children": [],
            "products_count": 14
          }
        ],
        "products_count": 14
      },
      {
        "id": 289,
        "name": "Анклет",
        "full_name": "Украшения на тело-1/Анклет",
        "parent_id": 288,
        "updated_at": "2014-09-28T23:07:35.809+04:00",
        "position": 36,
        "has_children?": false,
        "children": [],
        "products_count": 14
      },
      {
        "id": 290,
        "name": "Украшение на тело",
        "full_name": "Украшение на тело",
        "parent_id": null,
        "updated_at": "2014-09-28T23:07:38.510+04:00",
        "position": 35,
        "has_children?": true,
        "children": [
          {
            "id": 291,
            "name": "Цепь на тело",
            "full_name": "Украшение на тело/Цепь на тело",
            "parent_id": 290,
            "updated_at": "2014-09-28T23:07:38.520+04:00",
            "position": 34,
            "has_children?": false,
            "children": [],
            "products_count": 14
          }
        ],
        "products_count": 14
      },
      {
        "id": 291,
        "name": "Цепь на тело",
        "full_name": "Украшение на тело/Цепь на тело",
        "parent_id": 290,
        "updated_at": "2014-09-28T23:07:38.520+04:00",
        "position": 34,
        "has_children?": false,
        "children": [],
        "products_count": 14
      },
      {
        "id": 292,
        "name": "Браслет",
        "full_name": "Браслет",
        "parent_id": null,
        "updated_at": "2014-09-28T23:07:41.434+04:00",
        "position": 33,
        "has_children?": true,
        "children": [
          {
            "id": 293,
            "name": "Браслет",
            "full_name": "Браслет/Браслет",
            "parent_id": 292,
            "updated_at": "2014-09-28T23:07:41.454+04:00",
            "position": 32,
            "has_children?": false,
            "children": [],
            "products_count": 13
          },
          {
            "id": 310,
            "name": "Браслет на кисть",
            "full_name": "Браслет/Браслет на кисть",
            "parent_id": 292,
            "updated_at": "2014-09-28T23:08:43.011+04:00",
            "position": 15,
            "has_children?": false,
            "children": [],
            "products_count": 15
          }
        ],
        "products_count": 28
      },
      {
        "id": 293,
        "name": "Браслет",
        "full_name": "Браслет/Браслет",
        "parent_id": 292,
        "updated_at": "2014-09-28T23:07:41.454+04:00",
        "position": 32,
        "has_children?": false,
        "children": [],
        "products_count": 13
      },
      {
        "id": 310,
        "name": "Браслет на кисть",
        "full_name": "Браслет/Браслет на кисть",
        "parent_id": 292,
        "updated_at": "2014-09-28T23:08:43.011+04:00",
        "position": 15,
        "has_children?": false,
        "children": [],
        "products_count": 15
      },
      {
        "id": 294,
        "name": "Серьги",
        "full_name": "Серьги",
        "parent_id": null,
        "updated_at": "2014-09-28T23:07:43.967+04:00",
        "position": 31,
        "has_children?": true,
        "children": [
          {
            "id": 295,
            "name": "Кафф",
            "full_name": "Серьги/Кафф",
            "parent_id": 294,
            "updated_at": "2014-09-28T23:07:43.987+04:00",
            "position": 30,
            "has_children?": false,
            "children": [],
            "products_count": 18
          },
          {
            "id": 296,
            "name": "Кольцо в нос",
            "full_name": "Серьги/Кольцо в нос",
            "parent_id": 294,
            "updated_at": "2014-09-28T23:07:47.344+04:00",
            "position": 29,
            "has_children?": false,
            "children": [],
            "products_count": 3
          },
          {
            "id": 297,
            "name": "Пусеты",
            "full_name": "Серьги/Пусеты",
            "parent_id": 294,
            "updated_at": "2014-09-28T23:07:47.713+04:00",
            "position": 28,
            "has_children?": false,
            "children": [],
            "products_count": 34
          },
          {
            "id": 298,
            "name": "Серьги Люстры",
            "full_name": "Серьги/Серьги Люстры",
            "parent_id": 294,
            "updated_at": "2014-09-28T23:07:53.398+04:00",
            "position": 27,
            "has_children?": false,
            "children": [],
            "products_count": 14
          },
          {
            "id": 299,
            "name": "Серьги",
            "full_name": "Серьги/Серьги",
            "parent_id": 294,
            "updated_at": "2014-09-28T23:07:53.656+04:00",
            "position": 26,
            "has_children?": false,
            "children": [],
            "products_count": 20
          },
          {
            "id": 300,
            "name": "Серьги с обвесом",
            "full_name": "Серьги/Серьги с обвесом",
            "parent_id": 294,
            "updated_at": "2014-09-28T23:07:56.158+04:00",
            "position": 25,
            "has_children?": false,
            "children": [],
            "products_count": 9
          },
          {
            "id": 303,
            "name": "Моносерьга",
            "full_name": "Серьги/Моносерьга",
            "parent_id": 294,
            "updated_at": "2014-09-28T23:08:08.965+04:00",
            "position": 22,
            "has_children?": false,
            "children": [],
            "products_count": 12
          }
        ],
        "products_count": 110
      },
      {
        "id": 295,
        "name": "Кафф",
        "full_name": "Серьги/Кафф",
        "parent_id": 294,
        "updated_at": "2014-09-28T23:07:43.987+04:00",
        "position": 30,
        "has_children?": false,
        "children": [],
        "products_count": 18
      },
      {
        "id": 296,
        "name": "Кольцо в нос",
        "full_name": "Серьги/Кольцо в нос",
        "parent_id": 294,
        "updated_at": "2014-09-28T23:07:47.344+04:00",
        "position": 29,
        "has_children?": false,
        "children": [],
        "products_count": 3
      },
      {
        "id": 297,
        "name": "Пусеты",
        "full_name": "Серьги/Пусеты",
        "parent_id": 294,
        "updated_at": "2014-09-28T23:07:47.713+04:00",
        "position": 28,
        "has_children?": false,
        "children": [],
        "products_count": 34
      },
      {
        "id": 298,
        "name": "Серьги Люстры",
        "full_name": "Серьги/Серьги Люстры",
        "parent_id": 294,
        "updated_at": "2014-09-28T23:07:53.398+04:00",
        "position": 27,
        "has_children?": false,
        "children": [],
        "products_count": 14
      },
      {
        "id": 299,
        "name": "Серьги",
        "full_name": "Серьги/Серьги",
        "parent_id": 294,
        "updated_at": "2014-09-28T23:07:53.656+04:00",
        "position": 26,
        "has_children?": false,
        "children": [],
        "products_count": 20
      },
      {
        "id": 300,
        "name": "Серьги с обвесом",
        "full_name": "Серьги/Серьги с обвесом",
        "parent_id": 294,
        "updated_at": "2014-09-28T23:07:56.158+04:00",
        "position": 25,
        "has_children?": false,
        "children": [],
        "products_count": 9
      },
      {
        "id": 303,
        "name": "Моносерьга",
        "full_name": "Серьги/Моносерьга",
        "parent_id": 294,
        "updated_at": "2014-09-28T23:08:08.965+04:00",
        "position": 22,
        "has_children?": false,
        "children": [],
        "products_count": 12
      },
      {
        "id": 311,
        "name": "Кольцо",
        "full_name": "Кольцо/Кольцо",
        "parent_id": 301,
        "updated_at": "2014-09-28T23:08:46.021+04:00",
        "position": 14,
        "has_children?": false,
        "children": [],
        "products_count": 57
      },
      {
        "id": 312,
        "name": "Кольцо на 2 пальца",
        "full_name": "Кольцо/Кольцо на 2 пальца",
        "parent_id": 301,
        "updated_at": "2014-09-28T23:09:16.066+04:00",
        "position": 13,
        "has_children?": false,
        "children": [],
        "products_count": 3
      },
      {
        "id": 301,
        "name": "Кольцо",
        "full_name": "Кольцо",
        "parent_id": null,
        "updated_at": "2014-09-28T23:08:03.127+04:00",
        "position": 24,
        "has_children?": true,
        "children": [
          {
            "id": 311,
            "name": "Кольцо",
            "full_name": "Кольцо/Кольцо",
            "parent_id": 301,
            "updated_at": "2014-09-28T23:08:46.021+04:00",
            "position": 14,
            "has_children?": false,
            "children": [],
            "products_count": 57
          },
          {
            "id": 312,
            "name": "Кольцо на 2 пальца",
            "full_name": "Кольцо/Кольцо на 2 пальца",
            "parent_id": 301,
            "updated_at": "2014-09-28T23:09:16.066+04:00",
            "position": 13,
            "has_children?": false,
            "children": [],
            "products_count": 3
          },
          {
            "id": 302,
            "name": "Кольцо на весь палец",
            "full_name": "Кольцо/Кольцо на весь палец",
            "parent_id": 301,
            "updated_at": "2014-09-28T23:08:03.146+04:00",
            "position": 23,
            "has_children?": false,
            "children": [],
            "products_count": 25
          },
          {
            "id": 304,
            "name": "Миникольцо",
            "full_name": "Кольцо/Миникольцо",
            "parent_id": 301,
            "updated_at": "2014-09-28T23:08:11.414+04:00",
            "position": 21,
            "has_children?": false,
            "children": [],
            "products_count": 55
          },
          {
            "id": 308,
            "name": "Кольцо на ноготь",
            "full_name": "Кольцо/Кольцо на ноготь",
            "parent_id": 301,
            "updated_at": "2014-09-28T23:08:35.250+04:00",
            "position": 17,
            "has_children?": false,
            "children": [],
            "products_count": 12
          }
        ],
        "products_count": 152
      },
      {
        "id": 302,
        "name": "Кольцо на весь палец",
        "full_name": "Кольцо/Кольцо на весь палец",
        "parent_id": 301,
        "updated_at": "2014-09-28T23:08:03.146+04:00",
        "position": 23,
        "has_children?": false,
        "children": [],
        "products_count": 25
      },
      {
        "id": 304,
        "name": "Миникольцо",
        "full_name": "Кольцо/Миникольцо",
        "parent_id": 301,
        "updated_at": "2014-09-28T23:08:11.414+04:00",
        "position": 21,
        "has_children?": false,
        "children": [],
        "products_count": 55
      },
      {
        "id": 308,
        "name": "Кольцо на ноготь",
        "full_name": "Кольцо/Кольцо на ноготь",
        "parent_id": 301,
        "updated_at": "2014-09-28T23:08:35.250+04:00",
        "position": 17,
        "has_children?": false,
        "children": [],
        "products_count": 12
      },
      {
        "id": 320,
        "name": "1231",
        "full_name": "На шею/1231",
        "parent_id": 305,
        "updated_at": "2014-10-02T18:29:07.186+04:00",
        "position": 5,
        "has_children?": false,
        "children": [],
        "products_count": 0
      },
      {
        "id": 319,
        "name": "Под Нашею",
        "full_name": "На шею/Под Нашею",
        "parent_id": 305,
        "updated_at": "2014-10-02T18:28:11.903+04:00",
        "position": 6,
        "has_children?": false,
        "children": [],
        "products_count": 0
      },
      {
        "id": 305,
        "name": "На шею",
        "full_name": "На шею",
        "parent_id": null,
        "updated_at": "2014-09-28T23:08:33.776+04:00",
        "position": 20,
        "has_children?": true,
        "children": [
          {
            "id": 320,
            "name": "1231",
            "full_name": "На шею/1231",
            "parent_id": 305,
            "updated_at": "2014-10-02T18:29:07.186+04:00",
            "position": 5,
            "has_children?": false,
            "children": [],
            "products_count": 0
          },
          {
            "id": 319,
            "name": "Под Нашею",
            "full_name": "На шею/Под Нашею",
            "parent_id": 305,
            "updated_at": "2014-10-02T18:28:11.903+04:00",
            "position": 6,
            "has_children?": false,
            "children": [],
            "products_count": 0
          },
          {
            "id": 306,
            "name": "Леска",
            "full_name": "На шею/Леска",
            "parent_id": 305,
            "updated_at": "2014-09-28T23:08:33.788+04:00",
            "position": 19,
            "has_children?": false,
            "children": [],
            "products_count": 1
          },
          {
            "id": 307,
            "name": "Цепь",
            "full_name": "На шею/Цепь",
            "parent_id": 305,
            "updated_at": "2014-09-28T23:08:33.972+04:00",
            "position": 18,
            "has_children?": false,
            "children": [],
            "products_count": 7
          },
          {
            "id": 309,
            "name": "Кулон",
            "full_name": "На шею/Кулон",
            "parent_id": 305,
            "updated_at": "2014-09-28T23:08:37.796+04:00",
            "position": 16,
            "has_children?": false,
            "children": [],
            "products_count": 26
          }
        ],
        "products_count": 34
      },
      {
        "id": 306,
        "name": "Леска",
        "full_name": "На шею/Леска",
        "parent_id": 305,
        "updated_at": "2014-09-28T23:08:33.788+04:00",
        "position": 19,
        "has_children?": false,
        "children": [],
        "products_count": 1
      },
      {
        "id": 307,
        "name": "Цепь",
        "full_name": "На шею/Цепь",
        "parent_id": 305,
        "updated_at": "2014-09-28T23:08:33.972+04:00",
        "position": 18,
        "has_children?": false,
        "children": [],
        "products_count": 7
      },
      {
        "id": 309,
        "name": "Кулон",
        "full_name": "На шею/Кулон",
        "parent_id": 305,
        "updated_at": "2014-09-28T23:08:37.796+04:00",
        "position": 16,
        "has_children?": false,
        "children": [],
        "products_count": 26
      }
    ]
}