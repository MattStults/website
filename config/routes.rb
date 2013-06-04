Stults::Application.routes.draw do
    resources :jobs
    root :to => redirect('/jobs')
end
