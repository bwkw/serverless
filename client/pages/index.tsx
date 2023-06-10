import Link from 'next/link'

const Home = (): JSX.Element => {
  return (
    <div>
      <div>
        <Link href="/ssg" passHref>
          <div>SSG Page</div>
        </Link>
        <Link href="/ssr" passHref>
          <div>SSR Page</div>
        </Link>
        <Link href="/csr" passHref>
          <div>CSR Page</div>
        </Link>
        <Link href="/next-api" passHref>
          <div>CSR(Next Api) Page</div>
        </Link>
      </div>
    </div>
  )
}

export default Home
