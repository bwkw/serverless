import { FC } from 'react'
import useSWR from 'swr'

const Csr: FC = () => {
  return (
    <div>
      <DogImage />
    </div>
  )
}

const DogImage: FC = () => {
  const { data, error } = useSWR('https://dog.ceo/api/breeds/image/random', (url: string) =>
    fetch(url).then(res => res.json())
  )

  if (error) {
    return <div>fetch error</div>
  }
  if (!data) {
    return <div>loading...</div>
  }
  return <img src={data.message} alt={data.message} />
}

export default Csr
