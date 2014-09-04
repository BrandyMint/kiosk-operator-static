ACCEPT_FILE_TYPES = /(\.|\/)(gif|jpe?g|png)$/i
MAX_FILE_SIZE    = 10*1000*1000
MAX_NUMBER_OF_FILES = 6

window.ImagesFormMixin =
  prepareForm: ->

    $form = $(@getDOMNode()).closest 'form'

    @fileUploader = null

    ffu = $form.fileupload
      #url:               @props.savingUrl
      #dataType:          'json'
      acceptFileTypes:   ACCEPT_FILE_TYPES
      maxFileSize:       MAX_FILE_SIZE
      maxNumberOfFiles:  MAX_NUMBER_OF_FILES
      multipart:         true
      singleFileUploads: false
      autoUpload:        false
      replaceFileInput:  false
      pasteZone:         null
      #fileInput:         fileInput
      start: =>
        #@incrementActivities()
        @setState isInserting: false, imageUrl: null
      stop: =>
        #@decrementActivities()
        @setState uploadingProgress: 0
      
      fail:        (e, data) => NotifyController.errorResponse data
      done:        (e, data) => @props.doneCallback data.jqXHR.responseJSON

      dragover:    (e, data) => @dragOver()
      progressall: (e, data) =>
        progress = parseInt(data.loaded / data.total * 100, 10)
        @setState uploadingProgress: progress

      add:                   @addFileToForm

      formData: (form)       => @serializeArray @data()

  serializeArray: (data) ->
    return _.keys(data).map (key) ->  name: key,  value: data[key]

  addFileToForm: (e, data) ->
    console.warn 'new file uploader', data, @fileUploader if @fileUploader? && @fileUploader!=data
    @fileUploader = data
    # Когда загружается картинка через url случайно генерируется
    # это событие, но без файлов
    return if data.files.length==0
    # @post.unset 'image_url'
  
    images = data.files.map (file) ->
      image = new Image()
      image.src = window.URL.createObjectURL file
      image


    @getChangeCallback 'images', images

    @setState images: images, isInserting: false, imageUrl: null


