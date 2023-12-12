import { useContext } from "react"
import { VisibilityContext, VisibilityContextValues } from "../context/VisibilityContext"

/**
 * useVisibility hook returns VisibilityContext values.
 *
 * @returns
 */
const useVisibility = (): VisibilityContextValues => {
    const context = useContext(VisibilityContext)

    if (!context) throw new Error("useVisibility must be within a VisbilityProvider.")

    return context
}

export default useVisibility