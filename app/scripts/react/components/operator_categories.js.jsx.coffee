###* @jsx React.DOM ###

window.OperatorCategories = React.createClass
  propTypes:
    categories:       React.PropTypes.array.isRequired

  getInitialState: ->
    categories:       @props.categories
    selectedCategory: null

  getDefaultProps: ->
    categories:
      [
        {
          id: 100
          name: "Украшение на тело"
          full_name: "Украшение на тело"
          parent_id: null
          updated_at: "2014-09-28T23:42:13.261+04:00"
          position: 24
          count: 123
          "has_children?": true
          children: [
            id: 101
            name: "Цепь на тело"
            full_name: "Украшение на тело/Цепь на тело"
            parent_id: 100
            updated_at: "2014-09-28T23:42:13.269+04:00"
            position: 23
            count: 123
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
          count: 321
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
              count: 300
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
              count: 21
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
          count: 300
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
          count: 21
          "has_children?": false
          children: []
        }
      ]

  render: ->
    subcategories = @_getSubcategories()

    return `<div>
              <div className="col-md-6">
                <OperatorCategories_NewCat onCategoryCreate={ this.handleCategoryCreate } />
                <br />
                <OperatorCategories_List categories=       { this.state.categories }
                                         onListItemClick=  { this.handleCategoryItemClick }
                                         onCategoryDelete= { this.handleCategoryDelete }
                                         onCategoryUpdate= { this.handleCategoryUpdate } />
              </div>
              <div className="col-md-6">
                { subcategories }
              </div>
            </div>`

  _getSubcategories: ->
    if @state.selectedCategory
      `<OperatorCategories_Subcategories selectedCategory={ this.state.selectedCategory } />`

  handleCategoryItemClick: (cat) ->
    @setState(selectedCategory: cat)

  handleCategoryDelete: (cat) ->
    # На случай удаления "выбранной" категории
    if @state.selectedCategory and @state.selectedCategory.id == cat.id
      selectedUpdate = null
    else
      selectedUpdate = @state.selectedCategory

    @setState {
      categories: _.reject @state.categories, (i) -> i.id == cat.id
      selectedCategory: selectedUpdate
    }
    # todo: http delete

  handleCategoryUpdate: (cat) ->
    @setState(categories: _.map @state.categories, (i) -> if i.id == cat.id then cat else i)
    # todo: http put

  handleCategoryCreate: (cat) ->
    @setState(categories: [cat].concat(@state.categories))
    # todo: http post + update id
