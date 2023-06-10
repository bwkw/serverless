import type { GetStaticProps } from 'next'
import type { FC } from 'react'

type Props = {
  currentTime: string
}

const Ssg: FC<Props> = ({ currentTime }) => {
  return (
    <div>
      <h1>
        SSG だとビルド時にレンダリングされているため時刻が変わらない
      </h1>
      <div>{currentTime}</div>
    </div>
  )
}

export const getStaticProps: GetStaticProps = async () => {
  const currentTime = new Date().toISOString()

  return {
    props: {
      currentTime
    }
  }
}

export default Ssg
