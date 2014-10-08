# На основе http://api.kormilica.info/#!/operator

window.OperatorCategories_API =
  getCategories: (callback) ->
    if !@mockMode
      $.ajax
        dataType: 'json'
        url:      Routes.operator_categories_url
        method:   'get'
        error: (xhr, status, err) ->
          callback err || status
        success: (data) ->
          callback null, data
    else
      that = @
      setTimeout ->
        callback null, that.mockData
      , @mockLatency

  createCategory: (data, callback) ->
    data = _.pick data, ['name', 'position', 'parent_id']
    if !@mockMode
      $.ajax
        dataType: 'json'
        url:      Routes.operator_categories_url
        data:     data
        method:   'post'
        error: (xhr, status, err) ->
          callback err || status
        success: (data) ->
          callback null, data
    else
      setTimeout ->
        callback null, data
      , @mockLatency

  # Пока непонятно, зачем этот маршрут в API, так как getCategories даёт
  # полную информацию по всем категориям
  getCategory: (id, callback) ->
    if !@mockMode
      $.ajax
        dataType: 'json'
        url:      Routes.operator_categories_item_url id
        method:   'get'
        error: (xhr, status, err) ->
          callback err || status
        success: (data) ->
          callback null, data
    else
      setTimeout ->
        callback null
      , @mockLatency

  updateCategory: (data, callback) ->
    id = data.id
    data = _.pick data, ['name', 'position', 'parent_id']
    if !@mockMode
      $.ajax
        dataType: 'json'
        url:      Routes.operator_categories_item_url id
        data:     data
        method:   'put'
        error: (xhr, status, err) ->
          callback err || status
        success: (data) ->
          callback null, data
    else
      setTimeout ->
        callback null
      , @mockLatency

  deleteCategory: (id, callback) ->
    if !@mockMode
      $.ajax
        dataType: 'json'
        url:      Routes.operator_categories_item_url id
        method:   'delete'
        error: (xhr, status, err) ->
          callback err || status
        success: (data) ->
          callback null, data
    else
      setTimeout ->
        callback null
      , @mockLatency

  updateCategories: (data, callback) ->
    # todo. Очень грубая замена. Надо бы делать хотя бы async.parallel
    done = _.after data.length, ->
      callback()
    that = @
    _.each data, (i) ->
      that.updateCategory i, done

  mockMode: false
  mockLatency: 500
  mockData:
    [
      {
        id: 98
        name: "Украшения на тело"
        full_name: "Украшения на тело"
        parent_id: null
        updated_at: "2014-09-28T23:42:11.328+04:00"
        position: 26
        "has_children?": true
        children: [
          id: 99
          name: "Анклет"
          full_name: "Украшения на тело/Анклет"
          parent_id: 98
          updated_at: "2014-09-28T23:42:11.335+04:00"
          position: 25
          "has_children?": false
          children: []
        ]
      }
      {
        id: 99
        name: "Анклет"
        full_name: "Украшения на тело/Анклет"
        parent_id: 98
        updated_at: "2014-09-28T23:42:11.335+04:00"
        position: 25
        "has_children?": false
        children: []
      }
      {
        id: 100
        name: "Украшение на тело"
        full_name: "Украшение на тело"
        parent_id: null
        updated_at: "2014-09-28T23:42:13.261+04:00"
        position: 24
        "has_children?": true
        children: [
          id: 101
          name: "Цепь на тело"
          full_name: "Украшение на тело/Цепь на тело"
          parent_id: 100
          updated_at: "2014-09-28T23:42:13.269+04:00"
          position: 23
          "has_children?": false
          children: []
        ]
      }
      {
        id: 101
        name: "Цепь на тело"
        full_name: "Украшение на тело/Цепь на тело"
        parent_id: 100
        updated_at: "2014-09-28T23:42:13.269+04:00"
        position: 23
        "has_children?": false
        children: []
      }
      {
        id: 102
        name: "Браслет"
        full_name: "Браслет"
        parent_id: null
        updated_at: "2014-09-28T23:42:14.937+04:00"
        position: 22
        "has_children?": true
        children: [
          {
            id: 103
            name: "Браслет"
            full_name: "Браслет/Браслет"
            parent_id: 102
            updated_at: "2014-09-28T23:42:14.943+04:00"
            position: 21
            "has_children?": false
            children: []
          }
          {
            id: 120
            name: "Браслет на кисть"
            full_name: "Браслет/Браслет на кисть"
            parent_id: 102
            updated_at: "2014-09-28T23:42:54.241+04:00"
            position: 4
            "has_children?": false
            children: []
          }
        ]
      }
      {
        id: 103
        name: "Браслет"
        full_name: "Браслет/Браслет"
        parent_id: 102
        updated_at: "2014-09-28T23:42:14.943+04:00"
        position: 21
        "has_children?": false
        children: []
      }
      {
        id: 120
        name: "Браслет на кисть"
        full_name: "Браслет/Браслет на кисть"
        parent_id: 102
        updated_at: "2014-09-28T23:42:54.241+04:00"
        position: 4
        "has_children?": false
        children: []
      }
      {
        id: 104
        name: "Серьги"
        full_name: "Серьги"
        parent_id: null
        updated_at: "2014-09-28T23:42:16.513+04:00"
        position: 20
        "has_children?": true
        children: [
          {
            id: 105
            name: "Кафф"
            full_name: "Серьги/Кафф"
            parent_id: 104
            updated_at: "2014-09-28T23:42:16.520+04:00"
            position: 19
            "has_children?": false
            children: []
          }
          {
            id: 106
            name: "Кольцо в нос"
            full_name: "Серьги/Кольцо в нос"
            parent_id: 104
            updated_at: "2014-09-28T23:42:18.729+04:00"
            position: 18
            "has_children?": false
            children: []
          }
          {
            id: 107
            name: "Пусеты"
            full_name: "Серьги/Пусеты"
            parent_id: 104
            updated_at: "2014-09-28T23:42:19.103+04:00"
            position: 17
            "has_children?": false
            children: []
          }
          {
            id: 108
            name: "Серьги Люстры"
            full_name: "Серьги/Серьги Люстры"
            parent_id: 104
            updated_at: "2014-09-28T23:42:23.039+04:00"
            position: 16
            "has_children?": false
            children: []
          }
          {
            id: 109
            name: "Серьги"
            full_name: "Серьги/Серьги"
            parent_id: 104
            updated_at: "2014-09-28T23:42:23.173+04:00"
            position: 15
            "has_children?": false
            children: []
          }
          {
            id: 110
            name: "Серьги с обвесом"
            full_name: "Серьги/Серьги с обвесом"
            parent_id: 104
            updated_at: "2014-09-28T23:42:24.641+04:00"
            position: 14
            "has_children?": false
            children: []
          }
          {
            id: 113
            name: "Моносерьга"
            full_name: "Серьги/Моносерьга"
            parent_id: 104
            updated_at: "2014-09-28T23:42:33.004+04:00"
            position: 11
            "has_children?": false
            children: []
          }
        ]
      }
      {
        id: 105
        name: "Кафф"
        full_name: "Серьги/Кафф"
        parent_id: 104
        updated_at: "2014-09-28T23:42:16.520+04:00"
        position: 19
        "has_children?": false
        children: []
      }
      {
        id: 106
        name: "Кольцо в нос"
        full_name: "Серьги/Кольцо в нос"
        parent_id: 104
        updated_at: "2014-09-28T23:42:18.729+04:00"
        position: 18
        "has_children?": false
        children: []
      }
      {
        id: 107
        name: "Пусеты"
        full_name: "Серьги/Пусеты"
        parent_id: 104
        updated_at: "2014-09-28T23:42:19.103+04:00"
        position: 17
        "has_children?": false
        children: []
      }
      {
        id: 108
        name: "Серьги Люстры"
        full_name: "Серьги/Серьги Люстры"
        parent_id: 104
        updated_at: "2014-09-28T23:42:23.039+04:00"
        position: 16
        "has_children?": false
        children: []
      }
      {
        id: 109
        name: "Серьги"
        full_name: "Серьги/Серьги"
        parent_id: 104
        updated_at: "2014-09-28T23:42:23.173+04:00"
        position: 15
        "has_children?": false
        children: []
      }
      {
        id: 110
        name: "Серьги с обвесом"
        full_name: "Серьги/Серьги с обвесом"
        parent_id: 104
        updated_at: "2014-09-28T23:42:24.641+04:00"
        position: 14
        "has_children?": false
        children: []
      }
      {
        id: 113
        name: "Моносерьга"
        full_name: "Серьги/Моносерьга"
        parent_id: 104
        updated_at: "2014-09-28T23:42:33.004+04:00"
        position: 11
        "has_children?": false
        children: []
      }
      {
        id: 123
        name: "Браслет-нить"
        full_name: "Браслет-нить"
        parent_id: null
        updated_at: "2014-09-28T23:43:16.522+04:00"
        position: 1
        "has_children?": false
        children: []
      }
      {
        id: 122
        name: "Кольцо на 2 пальца"
        full_name: "Кольцо/Кольцо на 2 пальца"
        parent_id: 111
        updated_at: "2014-09-28T23:43:13.208+04:00"
        position: 2
        "has_children?": false
        children: []
      }
      {
        id: 111
        name: "Кольцо"
        full_name: "Кольцо"
        parent_id: null
        updated_at: "2014-09-28T23:42:29.024+04:00"
        position: 13
        "has_children?": true
        children: [
          {
            id: 122
            name: "Кольцо на 2 пальца"
            full_name: "Кольцо/Кольцо на 2 пальца"
            parent_id: 111
            updated_at: "2014-09-28T23:43:13.208+04:00"
            position: 2
            "has_children?": false
            children: []
          }
          {
            id: 112
            name: "Кольцо на весь палец"
            full_name: "Кольцо/Кольцо на весь палец"
            parent_id: 111
            updated_at: "2014-09-28T23:42:29.031+04:00"
            position: 12
            "has_children?": false
            children: []
          }
          {
            id: 114
            name: "Миникольцо"
            full_name: "Кольцо/Миникольцо"
            parent_id: 111
            updated_at: "2014-09-28T23:42:34.440+04:00"
            position: 10
            "has_children?": false
            children: []
          }
          {
            id: 118
            name: "Кольцо на ноготь"
            full_name: "Кольцо/Кольцо на ноготь"
            parent_id: 111
            updated_at: "2014-09-28T23:42:49.413+04:00"
            position: 6
            "has_children?": false
            children: []
          }
          {
            id: 121
            name: "Кольцо"
            full_name: "Кольцо/Кольцо"
            parent_id: 111
            updated_at: "2014-09-28T23:42:56.109+04:00"
            position: 3
            "has_children?": false
            children: []
          }
        ]
      }
      {
        id: 112
        name: "Кольцо на весь палец"
        full_name: "Кольцо/Кольцо на весь палец"
        parent_id: 111
        updated_at: "2014-09-28T23:42:29.031+04:00"
        position: 12
        "has_children?": false
        children: []
      }
      {
        id: 114
        name: "Миникольцо"
        full_name: "Кольцо/Миникольцо"
        parent_id: 111
        updated_at: "2014-09-28T23:42:34.440+04:00"
        position: 10
        "has_children?": false
        children: []
      }
      {
        id: 118
        name: "Кольцо на ноготь"
        full_name: "Кольцо/Кольцо на ноготь"
        parent_id: 111
        updated_at: "2014-09-28T23:42:49.413+04:00"
        position: 6
        "has_children?": false
        children: []
      }
      {
        id: 121
        name: "Кольцо"
        full_name: "Кольцо/Кольцо"
        parent_id: 111
        updated_at: "2014-09-28T23:42:56.109+04:00"
        position: 3
        "has_children?": false
        children: []
      }
      {
        id: 115
        name: "На шею"
        full_name: "На шею"
        parent_id: null
        updated_at: "2014-09-28T23:42:48.469+04:00"
        position: 9
        "has_children?": true
        children: [
          {
            id: 116
            name: "Леска"
            full_name: "На шею/Леска"
            parent_id: 115
            updated_at: "2014-09-28T23:42:48.477+04:00"
            position: 8
            "has_children?": false
            children: []
          }
          {
            id: 117
            name: "Цепь"
            full_name: "На шею/Цепь"
            parent_id: 115
            updated_at: "2014-09-28T23:42:48.606+04:00"
            position: 7
            "has_children?": false
            children: []
          }
          {
            id: 119
            name: "Кулон"
            full_name: "На шею/Кулон"
            parent_id: 115
            updated_at: "2014-09-28T23:42:50.948+04:00"
            position: 5
            "has_children?": false
            children: []
          }
        ]
      }
      {
        id: 116
        name: "Леска"
        full_name: "На шею/Леска"
        parent_id: 115
        updated_at: "2014-09-28T23:42:48.477+04:00"
        position: 8
        "has_children?": false
        children: []
      }
      {
        id: 117
        name: "Цепь"
        full_name: "На шею/Цепь"
        parent_id: 115
        updated_at: "2014-09-28T23:42:48.606+04:00"
        position: 7
        "has_children?": false
        children: []
      }
      {
        id: 119
        name: "Кулон"
        full_name: "На шею/Кулон"
        parent_id: 115
        updated_at: "2014-09-28T23:42:50.948+04:00"
        position: 5
        "has_children?": false
        children: []
      }
    ]
