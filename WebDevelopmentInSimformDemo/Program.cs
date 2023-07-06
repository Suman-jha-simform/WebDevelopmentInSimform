using FluentValidation;
using FluentValidation.AspNetCore;
using Microsoft.EntityFrameworkCore;
using Serilog;
using System;
using System.Reflection;
using WebDevelopmentInSimformDemo.Controllers;
using WebDevelopmentInSimformDemo.Database;
using WebDevelopmentInSimformDemo.Dto;
using WebDevelopmentInSimformDemo.Interface;
using WebDevelopmentInSimformDemo.MappingProfile;
using WebDevelopmentInSimformDemo.Repository;
using WebDevelopmentInSimformDemo.Validation;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();
builder.Services.AddDbContext<ApplicationContext>(options => options.UseSqlServer(builder.Configuration.GetConnectionString("ApplicationContext")));
builder.Services.AddScoped<IStudentRepository, StudentRepository>();
builder.Services.AddAutoMapper(cfg => cfg.AddProfile<MappingProfile>());
builder.Services.AddHttpClient<StudentController>();
builder.Services.AddSingleton<StudentValidator>();

builder.Services.Configure<StaticFileOptions>(options =>
{
    options.OnPrepareResponse = ctx =>
    {
        ctx.Context.Response.Headers["Cache-Control"] = "public,max-age=3600";
    };
});

Log.Logger = new LoggerConfiguration()
    .MinimumLevel.Information()
    .WriteTo.File( builder.Configuration.GetValue<string>("Paths:LogPath")!, rollingInterval :RollingInterval.Day)
    .CreateLogger();

builder.Host.UseSerilog();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
