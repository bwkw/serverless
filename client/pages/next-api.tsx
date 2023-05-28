import { FC } from 'react'
import useSWR from 'swr'

const NextApi: FC = () => {
  return (
    <div>
      <Name />
    </div>
  )
}

const Name: FC = () => {
  const { data, error } = useSWR('/api/hello', (url: string) => fetch(url).then(res => res.json()))

  if (error) {
    return <div>fetch error</div>
  }
  if (!data) {
    return <div>loading...</div>
  }
  return <div>{data.name}</div>
}

export default NextApi
