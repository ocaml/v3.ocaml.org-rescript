import IndexRes from "res_pages/Index";

export { getStaticProps } from "res_pages/Index"

export default function Index(props) {
    return <IndexRes {...props} />
}