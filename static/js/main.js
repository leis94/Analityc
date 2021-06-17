new Vue({
  delimiters: ["[[", "]]"],
  el: '#app',
  vuetify: new Vuetify(),
  data: () => ({
    error: '',
    overlay: false,
		rules: [
			v => !!v || 'Archivo requerido',
		],
  }),
  methods: {
    send(){
			if (this.$refs.form.validate()){
				this.overlay = true
				var formData = new FormData();
				var file = document.querySelector('#file_pjs');
				formData.append("file", file.files[0]);
				console.log(formData, file)
				const csrftoken = document.querySelector('[name=csrfmiddlewaretoken]').value;
				axios.post("/import_pjs", formData, {headers: {'X-CSRFToken': csrftoken}})
					.then(r => r.data)
					.then(response => {
						console.log(response)
					})
			}
    }
  },
})