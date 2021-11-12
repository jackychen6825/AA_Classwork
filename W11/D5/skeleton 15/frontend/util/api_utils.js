export const fetchAllPokemon = () => {
    return $.ajax({
        method: "GET",
        url: "/api/pokemon"
    }).then(
        res => console.log(res)
    )
}