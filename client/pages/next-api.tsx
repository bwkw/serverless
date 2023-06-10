import type { FC } from 'react'

import useSWR from 'swr'

const NextApi: FC = () => {
  return (
    <div>
      <Name />
    </div>
  )
}

const Name: FC = () => {
  const { data, error } = useSWR('/api/hello', async (url: string) => await fetch(url).then(async res => await res.json()))

  if (error !== undefined) {
    return <div>fetch error</div>
  }
  if (data === undefined) {
    return <div>loading...</div>
  }

  return <div>{data.name}</div>
}

export default NextApi
