const t = () => {
	let yomama = "fat"
	let mymama = "phat"

	let mamas = [yomama, mymama]

	mamas = mamas.map((mama: string) => {
		return mama + " as hell"
	})

	return mamas
}

console.log(t())
