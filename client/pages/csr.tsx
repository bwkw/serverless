import type { FC } from 'react'

import Image from 'next/image'
import useSWR from 'swr'

const Csr: FC = () => {
  return (
    <div>
      <DogImage />
    </div>
  )
}

const DogImage: FC = () => {
  const { data, error } = useSWR('https://dog.ceo/api/breeds/image/random', async (url: string) => {
    const res = await fetch(url)
    return await res.json()
  })

  if (error !== undefined) {
    return <div>fetch error</div>
  }
  if (data === undefined) {
    return <div>loading...</div>
  }

  return (
    <Image
      src={data.message}
      alt={data.message}
      width={500}
      height={300}
    />
  )
}

export default Csr
