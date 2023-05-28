import type { GetServerSideProps } from 'next'
import type { FC } from 'react'

type Props = {
  currentTime: string
}

const Ssr: FC<Props> = ({ currentTime }) => {
  return (
    <div>
      <h1>
        SSR はリクエスト時にレンダリングされるためアクセスする度に時刻が変わる
      </h1>
      <div>{currentTime}</div>
    </div>
  )
}

export const getServerSideProps: GetServerSideProps = async () => {
  const currentTime = new Date().toISOString()

  return {
    props: {
      currentTime
    }
  }
}

export default Ssr
