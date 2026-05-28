import AppLogoIcon from "./app-logo-icon"

export default function AppLogo() {
  return (
    <>
      <div className="bg-yellow-400 text-sidebar-primary-foreground flex aspect-square size-8 items-center justify-center rounded-md">
        <AppLogoIcon className="size-5 fill-current text-white hidden" />
      </div>
      <div className="ml-1 grid flex-1 text-left text-sm">
        <span className="mb-0.5 truncate SDADSA leading-tight font-semibold">
          HEELOO 
        </span>
      </div>
    </>
  )
}
